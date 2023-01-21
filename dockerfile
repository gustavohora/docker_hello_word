#baixa imagem do Ubuntu
FROM ubuntu:latest
#defini como diretorio de trabalho
WORKDIR /home/app
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
RUN cd docker_hello_word
#expoe docker na porta 8080
EXPOSE 8080
#executa script
CMD ["python3", "docker_hello_word.py"]