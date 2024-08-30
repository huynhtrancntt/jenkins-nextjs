# Stage 1: Build stage
# Sử dụng Node.js chính thức với phiên bản Alpine để tối ưu dung lượng image
FROM node:20.12.2-alpine AS builder

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép package.json và package-lock.json (nếu có)
COPY package*.json ./

# Cài đặt các dependencies
RUN npm install

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Thiết lập biến môi trường cho quá trình build
ARG NEXT_PUBLIC_API_HOST
ENV NEXT_PUBLIC_API_HOST=${NEXT_PUBLIC_API_HOST}

# Build ứng dụng Next.js
RUN npm run build

# Stage 2: Production stage
# Sử dụng một image Node.js chính thức nhưng nhẹ hơn để chạy ứng dụng
FROM node:20.12.2-alpine

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép toàn bộ build output từ stage build trước đó
COPY --from=builder /app ./

# Cài đặt các dependencies chỉ cần thiết cho production
RUN npm install --production

# Thiết lập biến môi trường để chạy ứng dụng ở chế độ production
ENV NODE_ENV=production

# Thiết lập biến môi trường API (nếu muốn override)
ENV NEXT_PUBLIC_API_HOST=${NEXT_PUBLIC_API_HOST}

# Mở cổng mà ứng dụng sẽ lắng nghe
EXPOSE 3000

# Chạy ứng dụng Next.js
CMD ["npm", "start"]
