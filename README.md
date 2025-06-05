
# 🏗️ COREX Chatbot
**COREX is an AI chatbot that provides real-time Q&A services regarding construction site safety regulations.**

A construction safety regulation chatbot built with **ChatGPT API**, **FastAPI (backend)**, and **Swift (frontend)**. The chatbot provides real-time responses based on **KOSHA** (Korea Occupational Safety and Health Agency) guidelines.

---

## Team #6 
| ![](https://github.com/LEE-Hyeon0771.png) | ![](https://github.com/noahljnf.png) | ![](https://github.com/HM00-0.png) | ![](https://github.com/liiionnnn.png) |
| :--------------------------------------: | :--------------------------------------: | :--------------------------------------: | :-----------------------------------: |
|             **Hyeon LEE<br>(Backend Developer)<br>**              |             **Noah<br>(Frontend Developer)<br>**              |             **Hyemin RYU<br>(Designer)<br>**              |            **RaeYun KIM<br>(DB Mananger)<br>**            |
## 📱 Preview

| Welcome Screen | Chat Screen | Expanded Answer | 
|----------------|----------------|----------------|
| ![image](https://github.com/user-attachments/assets/c4c81ddb-cd28-437b-a411-3740e084c3a0)|![image](https://github.com/user-attachments/assets/1e14f309-fdec-414f-9526-842ef83a67e3)|![image](https://github.com/user-attachments/assets/51b64874-f7db-4909-a637-df0d1da999dc)|


---

## 🛠️ Features

- Ask safety-related construction questions
- Retrieves content based on KOSHA guidelines
- Shows [Question], [Relevant Regulation Summary], [Expert Answer], and [Recommendation]
- Clean iOS UI with Swift
- Stateless FastAPI backend connected to ChatGPT API

---

## 📦 Tech Stack

| division        | stack                                                                                                                                                                                                                                                                                                       |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Front-end       | <img src="https://img.shields.io/badge/Swift-F05032?style=for-the-badge&logo=Swift&logoColor=black">  |
| Back-end        | <img src="https://img.shields.io/badge/FASTAPI-61DAFB?style=for-the-badge&logo=FASTAPI&logoColor=black"> |
| DB              | <img src="https://img.shields.io/badge/FaissDB-4479A1?style=for-the-badge&logo=FaissDB&logoColor=black"> |
| AI skill        | <img src="https://img.shields.io/badge/langchain-181717?style=for-the-badge&logo=langchain&logoColor=white"> <img src="https://img.shields.io/badge/RAG-181717?style=for-the-badge&logo=RAG&logoColor=black">
| AI model        | <img src="https://img.shields.io/badge/GPT-6DB33F?style=for-the-badge&logo=GPT&logoColor=black">
| Code Management | <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> |

---

## 🚀 Getting Started

### 1. Backend (FastAPI)
```bash
# Install dependencies
pip install -r requirements.txt

# Run the FastAPI server
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### 2. Frontend (Swift)
- Open the Xcode project (`COREX.xcodeproj`)
- Ensure API endpoint matches FastAPI server address
- Run on iPhone simulator or physical device

---

## 💬 Example Questions

- “I need guidelines for Gang Form installation”
- “More details about safety railings, please”
- “What are the safety requirements for work platforms?”

---

## 💬 Usage Example
```
👷 User: I need guidelines for Gang Form installation

🤖 COREX Bot:
[Question]
I need some guidelines for Gang Form installation.

[Relevant Regulation Summary]
The KOSHA Guide C-59-2022 provides guidelines for installing safety railings and work platforms on sloped roofs...

[Expert Answer]
Ensure that the work platforms are at least 3 meters in length, with a width of at least 400 mm...

[Recommendation]
Pay special attention to the specifications regarding work platform dimensions, structural requirements...
```

## 📁 Project Structure
```
COREX/
├── backend/
│   ├── app/
│   │   ├── api.py
│   │   ├── config.py
│   │   ├── pdf_loader.py
│   │   └── rag_engine.py
│   ├── data/manuals/
│   ├── db/faiss_index/
│   │   ├── index.faiss
│   │   └── index.pkl
│   ├── main.py
│   └── requirements.txt
│
├── frontend/
│   ├── Assets.xcassets/
│   ├── COREXApp.swift
│   ├── ChatMessage.swift
│   ├── ChatView.swift
│   ├── Chatbot.swift
│   ├── MainView.swift
│   ├── MessageBubble.swift
│   └── TypingMessageBubble.swift
│
├── .gitignore
├── COREX.xcodeproj/
└── README.md
```
