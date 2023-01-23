from set_data_utils import create_cursor


def refactor_query(query, id, key_file):
    refactored_query = ''
    if 'product' in key_file:
        refactored_query = query[:-2] + id + ';'
    elif 'category' in key_file:
        refactored_query = query[:-27] + id + query[-26:]
    return refactored_query


def get_by_id(config, file_name, keys, id):
    cursor = create_cursor(config)
    if cursor:
        with open(file_name, 'r', encoding='UTF-8') as f:
            default_query = f.read()
            query = refactor_query(default_query, id, file_name)

        cursor.execute(query)
        data = cursor.fetchone()

        data_dict = {}
        for i in range(4):
            data_dict[keys[i]] = data[i]

        json_response = "'" + str(data_dict) + "'"

        return json_response


def get_product_by_id(config, id):
    file = 'get_queries/get_product_by_id_query.sql'
    keys = ['id', 'name', 'category', 'price']
    response = get_by_id(config, file, keys, id)
    return response


def get_category_by_id(config, id):
    file = 'get_queries/get_category_by_id_query.sql'
    keys = ['id', 'name', 'description', 'products_list']
    response = get_by_id(config, file, keys, id)
    return response