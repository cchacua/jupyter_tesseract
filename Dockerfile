# Jupyter distribution for OCR analysis

FROM jupyter/scipy-notebook:notebook-6.3.0

USER root
# Install tesseract
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository -y ppa:alex-p/tesseract-ocr-devel
RUN apt-get update && apt-get install -y tesseract-ocr-all libmagickwand-dev ghostscript
RUN apt-get update && apt-get install -y imagemagick libpq-dev
RUN sed -i 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml

USER $NB_UID
# Install packages to correct kernel
RUN pip install opencv-python pytesseract pyhocr wand pdfminer.six psycopg2 PyPDF4 geocoder
RUN pip install spacy[transformers,lookups] flashtext
RUN python -m spacy download en_core_web_trf
