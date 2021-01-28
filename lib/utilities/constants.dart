library constants;

/* database */
const String TABLE_NAME = "image_table";
const String ID_COL = "id";
const String BASE64_COL = "base64";
const String CREATE_TABLE = "CREATE TABLE $TABLE_NAME ("
    "$ID_COL INTEGER PRIMARY KEY AUTOINCREMENT, "
    "$BASE64_COL TEXT"
    ");";
const String DATABASE_PATH = "$TABLE_NAME.db";

/* shared prefs keys */
const String USER_NAME_KEY = "username";
const String LANGUAGE_KEY = "language";
