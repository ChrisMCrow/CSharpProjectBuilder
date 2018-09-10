#!/usr/bin/env bash

# ask for project name
read -p 'Project name: ' projectName
echo 'Project name is "'$projectName'"'

# if there is no directory named $projectName
if [ -d ${projectName}.Solution ]; then
  echo Directory already exists...
else
  # make solution directory
  mkdir $projectName.Solution
  echo Make a new directory named $projectName.Solution...
fi

# make project directory and test directory
mkdir $projectName.Solution/$projectName $projectName.Solution/$projectName.Tests
echo Make new directories named $projectName and $projectName.Tests \in $projectName.Solution directory...

# make README.md file and git initialization
touch $projectName.Solution/README.md
echo Make $projectName.Solution/README.md file...
git init $projectName.Solution/
echo Initialize git...

# make project csproj file
touch $projectName.Solution/$projectName/$projectName.csproj
echo Make new csproj file at $projectName.Solution/$projectName directory...
echo '<Project Sdk="Microsoft.NET.Sdk.Web">' >> $projectName.Solution/$projectName/$projectName.csproj
echo '  <PropertyGroup>' >> $projectName.Solution/$projectName/$projectName.csproj
dotnetVersion="$(dotnet --version)"
echo '    <TargetFramework>netcoreapp1.1</TargetFramework>' >> $projectName.Solution/$projectName/$projectName.csproj
echo '  </PropertyGroup>' >> $projectName.Solution/$projectName/$projectName.csproj
echo '<ItemGroup>' >> $projectName.Solution/$projectName/$projectName.csproj
echo '  <PackageReference Include="Microsoft.AspNetCore" Version="1.1.2" />' >> $projectName.Solution/$projectName/$projectName.csproj
echo '  <PackageReference Include="Microsoft.AspNetCore.Http" Version="1.1.2" />' >> $projectName.Solution/$projectName/$projectName.csproj
echo '  <PackageReference Include="Microsoft.AspNetCore.Mvc" Version="1.1.3" />' >> $projectName.Solution/$projectName/$projectName.csproj
echo '</ItemGroup>' >> $projectName.Solution/$projectName/$projectName.csproj
echo '</Project>' >> $projectName.Solution/$projectName/$projectName.csproj
echo Initialize $projectName.Solution/$projectName/$projectName.csproj file...

# make project startup.cs file
touch $projectName.Solution/$projectName/Startup.cs
echo Make new startup file at $projectName.Solution/$projectName directory...
echo 'using Microsoft.AspNetCore.Builder;' >> $projectName.Solution/$projectName/Startup.cs
echo 'using Microsoft.AspNetCore.Hosting;' >> $projectName.Solution/$projectName/Startup.cs
echo 'using Microsoft.AspNetCore.Http;' >> $projectName.Solution/$projectName/Startup.cs
echo 'using Microsoft.Extensions.Configuration;' >> $projectName.Solution/$projectName/Startup.cs
echo 'using Microsoft.Extensions.DependencyInjection;' >> $projectName.Solution/$projectName/Startup.cs
echo '' >> $projectName.Solution/$projectName/Startup.cs
echo 'namespace '$projectName >> $projectName.Solution/$projectName/Startup.cs
echo '{' >> $projectName.Solution/$projectName/Startup.cs
echo '    public class Startup' >> $projectName.Solution/$projectName/Startup.cs
echo '    {' >> $projectName.Solution/$projectName/Startup.cs
echo '        public Startup(IHostingEnvironment env)' >> $projectName.Solution/$projectName/Startup.cs
echo '        {' >> $projectName.Solution/$projectName/Startup.cs
echo '            var builder = new ConfigurationBuilder()' >> $projectName.Solution/$projectName/Startup.cs
echo '                .SetBasePath(env.ContentRootPath)' >> $projectName.Solution/$projectName/Startup.cs
echo '                .AddEnvironmentVariables();' >> $projectName.Solution/$projectName/Startup.cs
echo '            Configuration = builder.Build();' >> $projectName.Solution/$projectName/Startup.cs
echo '        }' >> $projectName.Solution/$projectName/Startup.cs
echo '' >> $projectName.Solution/$projectName/Startup.cs
echo '        public IConfigurationRoot Configuration { get; }' >> $projectName.Solution/$projectName/Startup.cs
echo '' >> $projectName.Solution/$projectName/Startup.cs
echo '        public void ConfigureServices(IServiceCollection services)' >> $projectName.Solution/$projectName/Startup.cs
echo '        {' >> $projectName.Solution/$projectName/Startup.cs
echo '            services.AddMvc();' >> $projectName.Solution/$projectName/Startup.cs
echo '        }' >> $projectName.Solution/$projectName/Startup.cs
echo '' >> $projectName.Solution/$projectName/Startup.cs
echo '        public void Configure(IApplicationBuilder app)' >> $projectName.Solution/$projectName/Startup.cs
echo '        {' >> $projectName.Solution/$projectName/Startup.cs
echo '            app.UseDeveloperExceptionPage();' >> $projectName.Solution/$projectName/Startup.cs
echo '            app.UseMvc(routes =>' >> $projectName.Solution/$projectName/Startup.cs
echo '            {' >> $projectName.Solution/$projectName/Startup.cs
echo '                routes.MapRoute(' >> $projectName.Solution/$projectName/Startup.cs
echo '                    name: "default",' >> $projectName.Solution/$projectName/Startup.cs
echo '                    template: "{controller=Home}/{action=Index}/{id?}");' >> $projectName.Solution/$projectName/Startup.cs
echo '            });' >> $projectName.Solution/$projectName/Startup.cs
echo '            app.Run(async (context) =>' >> $projectName.Solution/$projectName/Startup.cs
echo '            {' >> $projectName.Solution/$projectName/Startup.cs
echo '                await context.Response.WriteAsync("Hello World!");' >> $projectName.Solution/$projectName/Startup.cs
echo '            });' >> $projectName.Solution/$projectName/Startup.cs
echo '        }' >> $projectName.Solution/$projectName/Startup.cs
echo '    }' >> $projectName.Solution/$projectName/Startup.cs
echo '}' >> $projectName.Solution/$projectName/Startup.cs

# implement dotnet restore at project directory
dotnet restore $projectName.Solution/$projectName
echo implement dotnet restore at project directory...

# make project Program.cs file
touch $projectName.Solution/$projectName/Program.cs
echo Make new program file at $projectName.Solution/$projectName directory...
echo 'using System.IO;' >> $projectName.Solution/$projectName/Program.cs
echo 'using Microsoft.AspNetCore.Hosting;' >> $projectName.Solution/$projectName/Program.cs
echo '' >> $projectName.Solution/$projectName/Program.cs
echo 'namespace '$projectName >> $projectName.Solution/$projectName/Program.cs
echo '{' >> $projectName.Solution/$projectName/Program.cs
echo '    public class Program' >> $projectName.Solution/$projectName/Program.cs
echo '    {' >> $projectName.Solution/$projectName/Program.cs
echo '        public static void Main(string[] args)' >> $projectName.Solution/$projectName/Program.cs
echo '        {' >> $projectName.Solution/$projectName/Program.cs
echo '            var host = new WebHostBuilder()' >> $projectName.Solution/$projectName/Program.cs
echo '                .UseKestrel()' >> $projectName.Solution/$projectName/Program.cs
echo '                .UseContentRoot(Directory.GetCurrentDirectory())' >> $projectName.Solution/$projectName/Program.cs
echo '                .UseIISIntegration()' >> $projectName.Solution/$projectName/Program.cs
echo '                .UseStartup<Startup>()' >> $projectName.Solution/$projectName/Program.cs
echo '                .Build();' >> $projectName.Solution/$projectName/Program.cs
echo '' >> $projectName.Solution/$projectName/Program.cs
echo '            host.Run();' >> $projectName.Solution/$projectName/Program.cs
echo '        }' >> $projectName.Solution/$projectName/Program.cs
echo '    }' >> $projectName.Solution/$projectName/Program.cs
echo '}' >> $projectName.Solution/$projectName/Program.cs

# make project test csproj file
touch $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '<Project Sdk="Microsoft.NET.Sdk">' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  <PropertyGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <TargetFramework>netcoreapp1.1</TargetFramework>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  </PropertyGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  <ItemGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="15.8.0" />' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <PackageReference Include="MSTest.TestAdapter" Version="1.3.2" />' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <PackageReference Include="MSTest.TestFramework" Version="1.3.2" />' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  </ItemGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  <ItemGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <ProjectReference Include="..\'$projectName'\'$projectName'.csproj" />' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  </ItemGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '</Project>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo Initialize $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj file...

# implement dotnet restore at test directory
dotnet restore $projectName.Solution/$projectName.Tests
echo implement dotnet restore at \test directory...

# make models directory
mkdir $projectName.Solution/$projectName/Models
echo Make $projectName.Solution/$projectName/Models directory...

# make controllers directory
mkdir $projectName.Solution/$projectName/Controllers
echo Make $projectName.Solution/$projectName/Controllers directory...

# make project home controller file
touch $projectName.Solution/$projectName/Controllers/HomeController.cs
echo 'using Microsoft.AspNetCore.Mvc;' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo 'using '$projectName'.Models;'
echo '' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo 'namespace '$projectName'.Controllers' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo '{' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo '    public class HomeController : Controller' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo '    {' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo ''
echo '    }' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo '}' >> $projectName.Solution/$projectName/Controllers/HomeController.cs

# make views and home directories
mkdir $projectName.Solution/$projectName/Views
echo Make $projectName.Solution/$projectName/Views directory...
mkdir $projectName.Solution/$projectName/Views/Home
echo Make $projectName.Solution/$projectName/Views/Home directory...

# .gitignore
touch $projectName.Solution/$projectName/.gitignore
echo 'obj/' >> $projectName.Solution/$projectName/.gitignore
echo 'bin/' >> $projectName.Solution/$projectName/.gitignore


# make models.test directory
mkdir $projectName.Solution/$projectName.Tests/ModelTests
echo Make $projectName.Solution/$projectName.Tests/ModelTests directory...
