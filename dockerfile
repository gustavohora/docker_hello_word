#baixa imagem do Ubuntu
FROM ubuntu:latest
#cria diretorio
RUN mkdir -p /usr/src/app
#defini como diretorio de trabalho
WORKDIR /usr/src/app
#instala python
RUN apt-get update && apt-get upgrade -y
#instala python
RUN apt-get install python3 -y
#instala pip
RUN apt-get install python3-pip -y
#copia requirements.txt para nova imagem criada
COPY requirements.txt ./
#instala libs
RUN pip install -r requirements.txt
#instala git
RUN apt-get install git -y
#clona projeto do git
RUN git clone https://github.com/gustavohora/docker_hello_word.git
#entra no projeto clonado
RUN cd docker_hello_word/script
#copia script.py para nova imagem criada
COPY script/docker_hello_word.py .
#expoe docker na porta 8080
EXPOSE 8080
#executa script.py
CMD ["python", "docker_hello_word.py"]