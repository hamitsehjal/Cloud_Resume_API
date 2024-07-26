const { app, input } = require("@azure/functions");
const { render } = require("jsonresume-theme-elegant");

const cosmosInput = input.cosmosDB({
  databaseName: "resume-db",
  containerName: "resume-container",
  connection: "CosmosDBConnectionString",
});

app.http("resume", {
  methods: ["GET", "POST"],
  authLevel: "anonymous",
  route: "hamitsehjal",
  extraInputs: [cosmosInput],
  handler: async (request, context) => {
    context.log(`Http function processed request for url "${request.url}"`);
    const documents = context.extraInputs.get(cosmosInput);
    if (documents && documents.length > 0) {
      const { id, _rid, _self, _etag, _attachments, _ts, ...cleanedDocument } =
        documents[0];

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
    }

    return { body: `Resume not Found!!`, statusCode: 404 };
  },
});
