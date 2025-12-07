# Install Project
### Clone Project
```sh
git clone https://github.com/Nextjingjing/RAG-chomaDB-KU-undergraduate-regulations.git
cd RAG-chomaDB-KU-undergraduate-regulations
```
### Activate Virtual Environment
- macOS / Linux
```
source .venv/bin/activate
```
- Windows (PowerShell)
```
.venv\Scripts\activate
```
## Install Dependencies with uv
```
uv sync
```
## Install Dependencies with pip
```
pip install -r requirements.txt
```
## Environment Variables

Create a `.env` file in the project root folder based on `example.env`.
This project uses OpenAI API with the model:
- **GPT-4o-mini** 
  
For example:
```
OPENAI_API_KEY=sk-proj-YOUR_OPENAI_API_KEY
```

## Docker

```sh
docker build -t my-rag-jupyter .
docker run -it \
  -p 8888:8888 \
  --env-file .env \
  -v "$(pwd)":/app \
  my-rag-jupyter

```
Access JupyterLab
Check the link with the token shown in the container logs.
```
http://127.0.0.1:8888/lab?token=<your_token_here>
```

# dataset
### Kasetsart University Undergraduate Regulations B.E. 2566 (2023)

This project uses Kasetsart University Undergraduate Regulations B.E. 2566 (2023) as a knowledge source.
The regulation document contains 16 pages and is separated into 6 main sections for effective retrieval in the RAG system:
- Section 1 — Admission and Education System
- Section 2 — Tuition Fees
- Section 3 — Education Regulation
- Section 4 — Student Status
- Section 5 — Student Conduct and Discipline
- Section 6 — Academic Advisor

PDF file download link: [Link Here](https://registrar.ku.ac.th/wp-content/uploads/2023/07/Kasetsart-University-Regulations-2566-sign.pdf)

# Try It Out
You can try running and testing the RAG system in the Jupyter Notebook located at:

📄 `src/rag.ipynb`

This notebook demonstrates how the model (OpenAI GPT-4o-mini) retrieves information from the dataset and generates answers.
