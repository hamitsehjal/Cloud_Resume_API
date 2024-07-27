# Cloud Resume API with Azure

![Deploy to Azure Functions](https://github.com/hamitsehjal/Serverless-Cloud-Resume/actions/workflows/function.yml/badge.svg)

A Serverless Cloud Resume API with Azure, supporting both JSON and HTML formats.

## Demo

### JSON Format (Default)

```
curl https://resume26hamitfunc.azurewebsites.net/
```

### HTML Format

```
curl https://resume26hamitfunc.azurewebsites.net/hamitsehjal
```

*For better results with the HTML version, copy the URL and paste it directly into your web browser.*

## Features

- Serves resume data in two formats:
    1. JSON: Available at the root URL
    2. HTML: Available at the `/hamitsehjal` route
- Uses Azure Functions for serverless architecture
- Stores data in CosmosDB for scalability and performance
- Infrastructure as Code using Terraform

## Tech-stack

- Azure Functions
- CosmosDB
- Terraform

## Usage

- To retrieve the resume in JSON format, send a GET request to the root URL.
- To retrieve the resume in HTML format, send a GET request to the `/hamitsehjal` route.

## Author

- Twitter: [@hamitsehjal](https://x.com/SehjalHamit)
- GitHub: [@hamitsehjal](https://github.com/hamitsehjal)
