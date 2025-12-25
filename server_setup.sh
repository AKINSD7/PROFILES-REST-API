echo "Installing dependencies..."

sudo apt update

sudo apt install -y \
  python3 \
  python3-pip \
  python3-dev \
  sqlite3 \
  build-essential \
  libpq-dev
