# 🌍 Gerenciador de Planetas - Flutter

## 📌 Aplicativo CRUD para Planetas  
Este projeto consiste em um aplicativo mobile desenvolvido em **Flutter**, permitindo o **gerenciamento de planetas** com operações CRUD (Criar, Ler, Atualizar e Deletar). O design do app é intuitivo e utiliza uma interface elegante com tons de **azul e verde**.

---

## 📖 Atividade da Disciplina de 12: Desenvolvimento de Aplicativos Móveis
Assista também o vídeo demonstrativo do aplicativo acessando o link abaixo:

🎥  https://youtu.be/7IjfxOc4sC4 

---

## 📋 Descrição  
O **Gerenciador de Planetas** permite cadastrar, editar e excluir planetas, além de manter um **histórico de planetas removidos**. O aplicativo utiliza um **banco de dados local (SQLite)** para armazenar os registros de forma persistente.

---

## 🚀 Funcionalidades  

✅ **Adicionar planetas** com nome, tamanho, distância e apelido.  
✅ **Editar informações** dos planetas cadastrados.  
✅ **Excluir planetas** (eles vão para o histórico).  
✅ **Histórico de planetas removidos** armazenado separadamente.  
✅ **Interface moderna e responsiva**, com botões estilizados e navegação intuitiva.  
✅ **Banco de Dados Local (SQLite)** para armazenamento persistente.  

---

## 🛠️ Estrutura do Código  
O projeto segue uma estrutura organizada, separando **modelos, telas e controle de dados**:

📂 `lib/`  
 ┣ 📁 `controle/` → Lida com o banco de dados e operações CRUD.  
 ┣ 📁 `modelo/` → Contém a classe `Planeta`.  
 ┣ 📁 `tela/` → Telas do app (`TelaPlaneta`, `TelaHistorico`, etc.).  
 ┣ 📄 `main.dart` → Tela inicial do aplicativo.  

---

## 📚 Aprendizado  
Este projeto envolve conceitos como:  
🔹 **Gerenciamento de estado** com `setState` para atualizar a UI.  
🔹 **Uso do SQLite** para persistência de dados localmente.  
🔹 **Navegação entre telas** com `Navigator.push()`.  
🔹 **Estilização aprimorada** utilizando `ThemeData` e `ElevatedButtonThemeData`.  

---

## 🔧 Tecnologias Utilizadas  
🛠️ **Flutter** - Framework principal  
🛠️ **Dart** - Linguagem de programação  
🛠️ **SQLite** - Banco de dados local  
