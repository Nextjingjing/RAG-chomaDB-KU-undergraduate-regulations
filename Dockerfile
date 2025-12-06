# syntax=docker/dockerfile:1

############################
# Build Stage
############################
FROM python:3.13-slim AS build

# Install uv from official image
COPY --from=ghcr.io/astral-sh/uv:0.8.21 /uv /uvx /bin/

WORKDIR /app

# Improve performance for uv
ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_HTTP_TIMEOUT=120

# Install dependencies first for caching
COPY pyproject.toml uv.lock ./
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev

# Copy your application code
COPY . .

############################
# Runtime Stage
############################
FROM python:3.13-slim AS runtime

# Create security-safe user
RUN groupadd -g 1001 appgroup && \
    useradd -u 1001 -g appgroup -m -d /app -s /bin/false appuser

WORKDIR /app

# Copy project and installed venv
COPY --from=build --chown=appuser:appgroup /app .

# Use installed virtual environment
ENV PATH="/app/.venv/bin:$PATH"

USER appuser

# Expose Jupyter port
EXPOSE 8888

# Default command (Jupyter Notebook)
CMD ["uv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]
