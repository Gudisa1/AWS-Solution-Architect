```sh
mvn archetype:generate -DgroupId=com.example \ -DartifactId=my-app \ -DarchetypeArtifactId=maven-archetype-quickstart \ -DinteractiveMode=false



mvn archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DarchetypeArtifactId=maven-archetype-quickstart \
  -DgroupId=com.example.myapp \
  -DartifactId=myapp \
  -Dversion=1.0-SNAPSHOT \
  -DinteractiveMode=false

```

### Explanation of the Command

- `archetype:generate`: The goal to generate a new project from an archetype.
- `-DgroupId=com.example`: Specifies the group ID for your project (replace with your desired group ID).
- `-DartifactId=my-app`: Specifies the artifact ID for your project (replace with your desired artifact ID).
- `-DarchetypeArtifactId=maven-archetype-quickstart`: Specifies the archetype to use, which provides a basic project structure (you can choose different archetypes based on your needs).
- `-DinteractiveMode=false`: Runs the command in non-interactive mode to avoid prompts.

### After Running the Command

1. **Navigate to the Project Directory:**

   ```bash
   cd my-app
   ```

2. **Build the Project:**

   ```bash
   mvn package
   ```

This will create a new Maven project with a standard directory structure and a basic setup that you can start working with.