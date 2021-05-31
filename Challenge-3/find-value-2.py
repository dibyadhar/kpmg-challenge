import json

object = {"x": {"y": {"z": "a"}}}
key = 'x/y/z'
keys = key.split('/')
key_value = keys[-1]


def findVal(key, obj):
    if key in obj:
        return obj[key]
    for i in obj.values():
        if isinstance(i, dict):
            test = findVal(key, i)
            if test is not None:
                return test


print(findVal(key_value, object))
