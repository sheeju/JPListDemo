{
	name => 'JPListDemo',
	default_view => 'Web',
	'Model::DB' => {
		traits       => "Caching",
		cursor_class => "DBIx::Class::Cursor::Cached",
		connect_info => {
			dsn               => "dbi:SQLite:__path_to(database,sqlite3.prod.db)__",
			quote_field_names => "0",
			quote_char        => "\"",
			name_sep          => ".",
			array_datatypes   => "1",
		},
	},
}
