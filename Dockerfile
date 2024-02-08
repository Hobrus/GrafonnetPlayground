FROM alpine:latest

# Установка Jsonnet и Git
RUN apk add --no-cache jsonnet git

# Клонирование Grafonnet
RUN git clone https://github.com/grafana/grafonnet-lib.git /grafonnet-lib

# Установка рабочего каталога
WORKDIR /app

# Копирование скрипта запуска и файла jsonnet в контейнер
COPY . /app/

# Выполнение скрипта при запуске контейнера
CMD ["./run.sh"]
