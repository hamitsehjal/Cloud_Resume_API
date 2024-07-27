const {app, input} = require("@azure/functions");
const {render} = require("jsonresume-theme-elegant");

const cosmosInput = input.cosmosDB({
    databaseName: "resume-db",
    containerName: "resume-container",
    connection: "CosmosDBConnectionString",
});

app.http("resume", {
    methods: ["GET", "POST"],
    authLevel: "anonymous",
    route: "{*route}",
    extraInputs: [cosmosInput],
    handler: async (request, context) => {
        context.log(`Http function processed request for url "${request.url}"`);
        const documents = context.extraInputs.get(cosmosInput);
        if (!documents || documents.length === 0) {
            return {
                statusCode: 404,
                body: "No Resume Found"
            }
        }

        // Removing cosmosDB metadata
        const {id, _rid, _self, _etag, _attachments, _ts, ...cleanedDocument} =
            documents[0];

        // Extracting route from the request
        const route = request.params.route || ""

        if (route === "hamitsehjal") {
            // Serve HTML Version
            try {
                const styledResume = render(cleanedDocument);
                return {
                    statusCode: 200,
                    headers: {
                        "content-type": "text/html",
                    },
                    body: styledResume,

                };
            } catch (error) {
                return {
                    body: JSON.stringify(cleanedDocument, null, 2),
                };
            }
        } else {
            // server JSON version
            return {
                body: JSON.stringify(cleanedDocument, null, 2),
            };
        }

    }


});
