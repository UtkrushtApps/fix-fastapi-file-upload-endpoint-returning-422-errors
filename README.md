# Task Overview
A document sharing API built with FastAPI currently fails to handle file uploads, resulting in HTTP 422 errors and blocking users from saving documents. The '/upload' endpoint expects payloads matching a Pydantic schema instead of accepting uploaded files.

# Guidance
- Review the existing upload endpoint implementation and identify why file uploads cause errors.
- Update the endpoint to properly accept and process standard file uploads.
- Ensure file handling constraints (e.g., max size) are respected.
- Containerize the project so that the service can run via Docker.

# Objectives
- Debug and fix the upload endpoint so that file uploads do not return 422 errors.
- Ensure valid files are saved and a JSON response is returned on success.
- Confirm the service works in a containerized environment.

# How to Verify
- Start the API in a container.
- POST a file (e.g., PDF or DOCX under 10MB) to the '/upload' endpoint with multipart/form-data.
- Check that the file is accepted and a valid JSON response is returned without a 422 error.
