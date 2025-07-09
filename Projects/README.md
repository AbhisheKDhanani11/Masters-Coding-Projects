AI-Powered Document and Email Processing Projects
Welcome to my repository of advanced AI projects! This collection showcases practical applications of Large Language Models (LLMs) and Natural Language Processing (NLP) to solve real-world challenges in data consumption and analysis.
Projects
This repository contains two main projects:

RAG System for Legal Document Summarization: An advanced Retrieval-Augmented Generation (RAG) system that can ingest and summarize long, dense legal documents with high accuracy.
MailCast: An automated pipeline that converts email newsletters into engaging, podcast-style audio episodes.

1. RAG System for Legal Document Summarization
This project implements a sophisticated RAG pipeline to tackle the challenge of summarizing lengthy and complex legal documents. Standard summarization methods often fail to capture the critical nuances of legal text. This system uses a multi-vector retrieval approach to ensure the final summary is both comprehensive and factually grounded.
How It Works

Data Preprocessing: The system ingests a PDF document and splits it into smaller, manageable chunks using PyPDFLoader and RecursiveCharacterTextSplitter.
Hierarchical Summarization: Instead of directly embedding the large chunks, the pipeline first generates a concise summary for each individual chunk using a model like gpt-3.5-turbo.
Intelligent Retrieval: These "micro-summaries" are embedded and stored in a Chroma vector store. When a query is made, the MultiVectorRetriever searches these summaries to find the most contextually relevant sections of the document.
Final Synthesis: The retrieved summaries are then passed to a more powerful model (gpt-4.1-mini) along with a detailed prompt, which synthesizes them into a final, structured, and highly accurate summary of the entire document.

Technologies Used

Framework: LangChain
LLMs: OpenAI GPT-3.5-turbo & GPT-4.1-mini
Vector Store: Chroma
Document Loading: PyPDFLoader
Text Processing: RecursiveCharacterTextSplitter

2. MailCast: Email-to-Audio Podcast Generator
MailCast is an end-to-end system that transforms your email inbox from a wall of text into a personal, on-demand audio podcast. It was designed to help busy professionals stay informed and to make email content more accessible. The system automatically fetches emails, cleans them, generates a podcast-style script, and converts it into a high-quality audio file.
How It Works

Secure Email Ingestion: The pipeline authenticates with a user's Gmail account using OAuth 2.0 and fetches the latest emails via the Google Gmail API.
Advanced Content Cleaning: Using the BeautifulSoup library, the system parses the HTML content of each email, intelligently extracting the main article while stripping away irrelevant clutter like ads, footers, and navigation links.
AI-Powered Script Generation: The cleaned text is then sent to Google's Gemini LLM. A carefully engineered prompt instructs the model to generate a two-part script:
Part 1: A full, verbatim reading of the cleaned email.
Part 2: A concise, abstractive summary of the key takeaways.


High-Fidelity Audio Synthesis: The complete script is converted into a natural-sounding audio file using OpenAI's tts-1 model. The system is designed to handle long emails by chunking the script to stay within API limits and then seamlessly stitching the audio segments back together with Pydub.

Technologies Used

APIs: Google Gmail API, Google Gemini, OpenAI TTS
Authentication: OAuth 2.0
Data Processing: BeautifulSoup, Regular Expressions (re)
Audio Processing: Pydub

Setup
To run the projects, install the required dependencies:
pip install -r requirements.txt

Key dependencies include:

langchain>=0.0.1
openai>=0.28.0
chromadb>=0.3.0
pypdf>=3.8.0
beautifulsoup4>=4.12.0
pydub>=0.25.0
google-auth-oauthlib>=1.0.0

Usage

Clone the repository:git clone https://github.com/AbhisheKDhanani11/Masters-Coding-Projects.git
cd Masters-Coding-Projects/Deep\ Learning


Install dependencies (see above).
Run individual project scripts:
For RAG System: python rag_legal_summarizer.py
For MailCast: python mailcast.py
Or open Jupyter notebooks (e.g., rag_legal_summarizer.ipynb) in Jupyter Notebook.



Notes

Ensure API keys for OpenAI, Google Gmail API, and Google Gemini are configured in environment variables or a configuration file.
Large datasets or output files (e.g., audio files) are tracked using Git LFS to handle file size limits.
Jupyter notebooks should have outputs cleared before committing to reduce file size.
