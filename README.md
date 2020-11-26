


### Как запустить тесты?
```
export PERL5LIB=lib:local/lib/perl5
prove -v --timer t/
```

### Структура:
```
├── bin                 # разрабатываемые скрипты
│   └── myscript.pl
├── lib                 # разрабатываемые модули
│   └── MyModule.pm
├── cpanfile            # файлик с описанием зависимостей
├── local               # внешние зависимости
│   ├── bin
│   ├── lib
│   └── man
├── README.md
└── t                       # тесты
    ├── 00_compile.t        # проверка компилябельности
    ├── 00_perlcritic.t     # проверка perlcritic'ом
    ├── lib                 # тесты для Test::Class::Moose (tcm.t)
    └── tcm.t
```