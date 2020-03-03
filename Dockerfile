# Jupyter distribution for OCR analysis

FROM jupyter/scipy-notebook


USER root
# Install tesseract
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository -y ppa:alex-p/tesseract-ocr
RUN apt-get update && apt-get install -y tesseract-ocr-all libmagickwand-dev ghostscript
RUN apt-get update && apt-get install -y imagemagick libpq-dev
RUN sed -i 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml

USER $NB_UID
# Install packages to correct kernel
RUN pip install 'jupyter_client==5.3.1' opencv-python pytesseract pyhocr wand pdfminer.six psycopg2 PyPDF4




