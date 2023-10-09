import json

# Open the file in read mode
file = open('voices.txt', 'r')

voices = []

for i in range(301):
    voices.append({"name": file.readline().replace("Name: ", "").replace("\n", ""), 
                   "gender": file.readline().replace("Gender: ", "").replace("\n", "")
    })
    _ = file.readline()

# Specify the name of the JSON file
json_file = "voices.json"

available_languages = ["en", "es"]

voices = [voice for voice in voices if voice['name'].split("-")[0] in available_languages]

# Open the file in write mode and save the list as JSON
with open(json_file, 'w') as file:
    json.dump(voices, file)

# Close the file
file.close()

