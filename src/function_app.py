import azure.functions as func
import logging
import json

app = func.FunctionApp()


@app.function_name(name="CosmosDBTrigger")
@app.cosmos_db_input(
    arg_name="documents",
    database_name="resume-db",
    container_name="resume-container",
    connection="CosmosDBConnectionString",
)
@app.route(route="/", auth_level=func.AuthLevel.ANONYMOUS)
def main(req: func.HttpRequest, documents: func.DocumentList) -> func.HttpResponse:
    logging.info("Python HTTP trigger function processed a request.")
    if len(documents) > 0:
        resume = documents[0]
        resume_dict = dict(resume)
        json_data = json.dumps(resume_dict, indent=2)
        return func.HttpResponse(
            body=json_data, mimetype="application/json", status_code=200
        )

    return func.HttpResponse(body="Resource not found", status_code=404)
