FROM python:3.10

# ENV SERVICE_NAME="my-service"
ARG APP_PATH="/my-fastapi"

WORKDIR $APP_PATH

ENV VIRTUAL_ENV="$APP_PATH/venv"
RUN python3.10 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install poetry

COPY . ${APP_PATH}
RUN poetry install
RUN python -m compileall ${APP_PATH}/APP_PATH

EXPOSE 8000
ENTRYPOINT ["poetry", "run", "python", "-m", "uvicorn", "--host", "0.0.0.0", "testtest.main:app"]