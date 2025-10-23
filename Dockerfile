# Use Python 3.13 slim image for smaller size
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY pyproject.toml ./
COPY src/ ./src/

# Install dependencies
RUN pip install --no-cache-dir google-search-results>=2.4.2 "mcp[cli]>=1.3.0" python-dotenv httpx

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Expose the MCP server (stdio mode doesn't need ports, but keeping for future HTTP mode)
# No EXPOSE needed for stdio mode

# Run the server
CMD ["python", "-m", "src.serpapi-mcp-server.server"]
