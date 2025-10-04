# docker run --rm -p 8889:8888 quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='mytoken'
# docker run --rm -p 8889:8888 -v "$(pwd)/notebooks:/home/jovyan/work" quay.io/jupyter/base-notebook start-notebook.py --NotebookApp.token='mytoken'

docker compose up --build

