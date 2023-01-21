#baixa imagem do Ubuntu
FROM ubuntu:latest
#instala git
RUN sudo apt-get install git
#cria diretorio
RUN mkdir -p  /usr/src/app
#instala python
RUN sudo apt-get install python3 -y
#instala pip
RUN sudo apt-get install python3-pip -y
#defini como diretorio de trabalho
WORKDIR /usr/src/app
#clona projeto do git
RUN git clone https://github.com/gustavohora/docker_hello_word.git
#entra no projeto clonado
RUN cd docker_hello_word/script
#copia requirements.txt para nova imagem criada
COPY requirements.txt ./
#insala libs
RUN pip install -r requirements.txt
#copia script.py para nova imagem criada
COPY script/docker_hello_word.py .
#expoe docker na porta 8080
EXPOSE 8080
#executa script.py
CMD ["python", "docker_hello_word.py"]