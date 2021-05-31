import requests
import sys

response = requests.get('http://169.254.169.254/latest/dynamic/instance-identity/document').json()
print(response)


def findVal(key, obj):
    if key in obj:
        return obj[key]
    for i in d.values():
        if isinstance(i, dict):
            result = findVal(key, i)
            if result is not None:
                return result


print(findVal(sys.argv[1], response))
