# Jupyter distribution for OCR analysis

FROM jupyter/scipy-notebook:42f4c82a07ff

USER root
# Install tesseract
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository -y ppa:alex-p/tesseract-ocr-devel
RUN apt-get update && apt-get install -y tesseract-ocr-all libmagickwand-dev ghostscript
RUN apt-get update && apt-get install -y imagemagick libpq-dev
RUN sed -i 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml

USER $NB_UID
# Install packages to correct kernel
RUN pip install opencv-python pytesseract pyhocr wand pdfminer.six psycopg2 PyPDF4 geocoder
RUN pip install spacy spacy-lookup spacy-lookups-data flashtext
RUN python -m spacy download en_core_web_md
RUN python -m spacy download en_core_web_lg
