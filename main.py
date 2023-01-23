import json

from set_data_utils import *
from get_utils import *


def main():
    with open('data/suppliers.json', 'r', encoding='utf-8') as file:
        suppliers_data = json.load(file)

    prepared_data = prepare_data(suppliers_data)

    list_of_values = convert_data_for_request(prepared_data)

    sql_file_1 = 'upd_queries/create_and_fill_table.sql'
    print(create_and_fill_new_table_to_file(sql_file_1, list_of_values))

    sql_file_2 = 'upd_queries/update_table.sql'
    print(refactor_existing_table_to_file(sql_file_2, suppliers_data))

    update_data_in_bd('const_db', sql_file_1)
    update_data_in_bd('const_db', sql_file_2)

    print(get_product_by_id('const_db', '3'))
    print(get_category_by_id('const_db', '3'))


if __name__ == '__main__':
    main()
