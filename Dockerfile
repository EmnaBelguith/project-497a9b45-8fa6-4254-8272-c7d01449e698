FROM python:3.9-slim-bullseye
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r /app/requirements.txt
COPY python_project/app.py /app/app.py
EXPOSE 5000
ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=app.py
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]