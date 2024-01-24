using System.Threading.Tasks;
using Grpc.Net.Client;
using GrpcGreeterClient;
using static GrpcGreeterClient.Greeter;

// The port number must match the port of the gRPC server.
using var channel = GrpcChannel.ForAddress("https://localhost:7043");

Console.WriteLine("Creating greeter client...");
GreeterClient client = new GreeterClient(channel);
Console.WriteLine("------------------");

HelloRequest request = new HelloRequest { Name = "GreeterClient" };
Console.WriteLine("Client:");
Console.WriteLine("  " + request.ToString());
HelloReply reply = await client.SayHelloAsync(request);

Console.WriteLine("Server:");
Console.WriteLine("  " + reply.Message);

request = new HelloRequest { Name = "Alex" };
Console.WriteLine("Client:");
Console.WriteLine("  " + request.ToString());
reply = await client.SayHelloAsync(request);

Console.WriteLine("Server:");
Console.WriteLine("  " + reply.Message);

Console.WriteLine("Press any key to exit...");
Console.ReadKey();