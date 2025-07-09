# AI-Powered Document and Email Processing Projects

This folder contains advanced AI projects developed during my Master's program, focusing on Large Language Models (LLMs) and Natural Language Processing (NLP) for real-world data consumption and analysis tasks.

## Overview

The projects in this folder demonstrate the application of state-of-the-art AI techniques to process and analyze complex data sources, such as legal documents and email newsletters. Key areas covered include:

- **Retrieval-Augmented Generation (RAG):** Summarizing dense legal documents with high accuracy using a multi-vector retrieval approach.
- **Text-to-Audio Processing:** Converting email content into podcast-style audio episodes for accessibility and convenience.
- **Data Processing & APIs:** Leveraging advanced APIs and libraries for document ingestion, text cleaning, and audio synthesis.

## Projects

- **RAG System for Legal Document Summarization**:
  - Implements a Retrieval-Augmented Generation pipeline to summarize lengthy legal documents.
  - Uses `PyPDFLoader` and `RecursiveCharacterTextSplitter` to preprocess PDFs into manageable chunks.
  - Generates "micro-summaries" for each chunk with `gpt-3.5-turbo`, stored in a Chroma vector store.
  - Employs `MultiVectorRetriever` for intelligent retrieval and `gpt-4.1-mini` for synthesizing a final, structured summary.
  - **Technologies**: LangChain, OpenAI GPT-3.5-turbo, GPT-4.1-mini, Chroma, PyPDFLoader, RecursiveCharacterTextSplitter.
  - **Files**: `rag_legal_summarizer.py` (or `.ipynb`).

- **MailCast: Email-to-Audio Podcast Generator**:
  - An end-to-end pipeline that transforms email newsletters into podcast-style audio episodes.
  - Fetches emails via Google Gmail API with OAuth 2.0 authentication.
  - Cleans HTML content using `BeautifulSoup`, removing clutter like ads and footers.
  - Uses Google’s Gemini LLM to generate a two-part script: verbatim email reading and a concise summary.
  - Converts scripts to audio with OpenAI’s `tts-1` model, stitching segments with `Pydub` for long emails.
  - **Technologies**: Google Gmail API, Google Gemini, OpenAI TTS, OAuth 2.0, BeautifulSoup, Regular Expressions (re), Pydub.
  - **Files**: `mailcast.py` (or `.ipynb`).

## Setup

To run the projects, install the required dependencies:

```bash
pip install -r requirements.txt
```

Key dependencies include:
- `langchain>=0.0.1`
- `openai>=0.28.0`
- `chromadb>=0.3.0`
- `pypdf>=3.8.0`
- `beautifulsoup4>=4.12.0`
- `pydub>=0.25.0`
- `google-auth-oauthlib>=1.0.0`

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/AbhisheKDhanani11/Masters-Coding-Projects.git
   cd Masters-Coding-Projects/Deep\ Learning
   ```
2. Install dependencies (see above).
3. Run individual scripts or notebooks:
   - RAG System: `python rag_legal_summarizer.py`
   - MailCast: `python mailcast.py`
   - Or open Jupyter notebooks (e.g., `rag_legal_summarizer.ipynb`) in Jupyter Notebook.


