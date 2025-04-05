-- Language-based code generation server for mcphub.nvim
local mcphub = require("mcphub")

-- Tool for generating code in specified language
mcphub.add_tool("codegen", {
  name = "generate",
  description = "Generate code in specified language based on requirements",
  inputSchema = {
    type = "object",
    properties = {
      language = {
        type = "string",
        description = "Programming language (e.g. python, javascript, typescript, lua)",
      },
      description = {
        type = "string",
        description = "Description of what code should do",
      },
      includeComments = {
        type = "boolean",
        description = "Whether to include comments in generated code",
        default = true,
      },
    },
    required = { "language", "description" },
  },
  handler = function(req, res)
    local lang = req.params.language:lower()
    local desc = req.params.description
    local comments = req.params.includeComments ~= false

    local response = "Generated " .. lang .. " code for: " .. desc .. "\n\n"

    if lang == "python" then
      response = response .. "```python\n"
      if comments then
        response = response .. "# " .. desc .. "\n"
      end
      response = response
        .. "def main():\n    # TODO: Implement "
        .. desc
        .. "\n    pass\n\nif __name__ == '__main__':\n    main()\n```"
    elseif lang == "javascript" or lang == "js" then
      response = response .. "```javascript\n"
      if comments then
        response = response .. "// " .. desc .. "\n"
      end
      response = response .. "function main() {\n  // TODO: Implement " .. desc .. "\n}\n\nmain();\n```"
    elseif lang == "typescript" or lang == "ts" then
      response = response .. "```typescript\n"
      if comments then
        response = response .. "// " .. desc .. "\n"
      end
      response = response .. "function main(): void {\n  // TODO: Implement " .. desc .. "\n}\n\nmain();\n```"
    elseif lang == "lua" then
      response = response .. "```lua\n"
      if comments then
        response = response .. "-- " .. desc .. "\n"
      end
      response = response
        .. "local function main()\n  -- TODO: Implement "
        .. desc
        .. "\n  return true\nend\n\nmain()\n```"
    else
      return res:error("Unsupported language: " .. lang)
    end

    return res:text(response):send()
  end,
})

-- Add resources for code templates
mcphub.add_resource_template("codegen", {
  name = "language_template",
  uriTemplate = "codegen://template/{language}",
  description = "Get basic code template for specific language",
  handler = function(req, res)
    local lang = req.params.language:lower()
    local template = ""

    if lang == "python" then
      template =
        'def main():\n    """Main function"""\n    print("Hello, World!")\n\nif __name__ == \'__main__\':\n    main()\n'
    elseif lang == "javascript" or lang == "js" then
      template = "// Main module\n\nfunction main() {\n  console.log('Hello, World!');\n}\n\nmain();\n"
    elseif lang == "typescript" or lang == "ts" then
      template = "// Main module\n\nfunction main(): void {\n  console.log('Hello, World!');\n}\n\nmain();\n"
    elseif lang == "lua" then
      template = "-- Main module\n\nlocal function main()\n  print('Hello, World!')\nend\n\nmain()\n"
    else
      return res:error("Unsupported language: " .. lang)
    end

    return res:text(template):send()
  end,
})

-- Making the server available
return true
