# Jak tworzyć spolszczenia do gier na Unreal Engine? :memo:
Ten poradnik pokazuje kompletny proces tworzenia pliku spolszczenia, od eksportu pliku -> przez tłumaczenie -> po ponowny import do plików gry.\
Starałem się napisać go jak najprościej, jednakże to jeden z pierwszych takich tekstów jakie przyszło mi napisać - więc miej to na uwadze.\
Wszystkie błędy zgłaszaj w zakładce Issues lub do mnie na dc: @shieldziak


## Spis treści:
[#1 Eksport stringów z plików gry.](JAK-EDYTOWAC.md#1-eksport-stringów-z-plików-gry)\
[#2 Eksport plików do formatu .po](JAK-EDYTOWAC.md#2-eksport-plików-do-formatu-po)\
[#3 Edycja plików](JAK-EDYTOWAC.md#3-edycja-plik%C3%B3w)\
[#4 Pakowanie plików](JAK-EDYTOWAC.md#4-pakowanie-plik%C3%B3w)

# #1 Eksport stringów z plików gry :dvd:
Aby móc edytować tekst w grze, należy wpierw wyeksportować go do formatu wspieranego przez narzędzia do edycji.\
Gry na silniku Unreal Engine najczęściej używają formatu **.pak** lub **.ucas**. My potrzebujemy formatu **.locres** z którym możemy cokolwiek zrobić.\

Oto jak go zdobyć:

1. Pobieramy narzędzie Fmodel i wybieramy w nim ścieżkę do plików gry (do folderu z głównym plikiem .exe)

![image](https://github.com/Shieldowskyy/spolszczenie-fnaf-sb/assets/32707076/27642dfb-7230-47c4-8d94-31c1f46945d1)

2. Dodajemy klucz AES który odszyfruje pakiet z plikami gry. Najprościej znaleźć go na redditcie!

![image](https://github.com/Shieldowskyy/spolszczenie-fnaf-sb/assets/32707076/d308401a-b7f7-4ee7-b533-f5421b0e58e1)

3. Otwieramy pliki .pak i szukamy folderu Localization w plikach gry! Następnie wchodzimy do folderu z **"en"** w nazwie

![image](https://github.com/Shieldowskyy/spolszczenie-fnaf-sb/assets/32707076/099c1c20-9116-4ec2-80b4-a871f697c92d)

4. Eksportujemy plik DLC.locres klikając prawym i **Export Raw Data**

![image](https://github.com/Shieldowskyy/spolszczenie-fnaf-sb/assets/32707076/f76b6c7b-6e8e-44b7-b1df-3d1ec890bbb3)

5. Plik powinien znajdować się w katalogu w którym wypakowaliśmy FModela z **zachowaną strukturą plików która potem nam się przyda!**

# #2 Eksport plików do formatu .pot :outbox_tray:
Program którego będziemy używać do tłumaczenia plików nosi nazwę PoEdit. Obsługuje on pliki **.po** oraz **.pot!** Ważne żeby wiedzieć co one oznaczają.

**.pot** - plik z szablonem tłumaczenia, zawierający tylko oryginalny tekst w języku angielskim. Jego właśnie uzyskujemy!\
**.po** - plik z tłumaczniem zawierający nasze zmienione ciągi tekstu. Zawiera także szablon. On przyda nam się na końcu!

### 2.0 Eksport
Aby wyeksportować plik do formatu obsługiwanego przez program PoEdit, należy użyć dołączonego narzedzia UnrealLocres. Uruchamiany powershell i robimy tak:

1. Przechodzimy do lokalizacji z plikami .locres oraz programem UnrealLocres\
 a nastepnie klikamy **Shift + Prawy przycisk myszy** i wybieramy "Otwórz tutaj okno programu PowerShell"

2. Następnie narzędziem UnrealLocres konwertujemy plik z formatu .locres do formatu .pot co zrobimy używając komendy ```./UnrealLocres.exe export DLC.locres -f pot```

3. W katalogu powinien się teraz znajdować plik DLC.pot na podstawie którego stworzymy plik z tłumaczeniem o formacie .po

# #3 Edycja plików :writing_hand:
Aby stworzyć tłumaczenie należy użyć jakiegoś programu, który ułatwi stworzenie pliku tłumaczenia **.po** na podstawie pliku szablonu **.pot**.
Teoretycznie dałoby się zrobić to nawet używając notatnika, jednak to bardzo niewygodne i mało bezpieczne, oraz podatne na błędy użytkownika!

Przykładowym programem którego początkowo używaliśmy był program **Poedit**. Jest on dostępny za darmo na tej stronie: https://poedit.net/
<br />W prosty sposób otworzy on nam plik i pozwoli na jego łatwą edycję oraz zapobiegnie popełnieniu typowych błędów składniowych.
**Nie ma potrzeby kupowania wersji Pro** ponieważ do tłumaczenia maszynowego wystarczy przeklejać ręcznie frazy do Tłumacza Google/Deepl.
> [!TIP]
> Jeżeli chesz tworzyć spolszczenie wspólnie z innymi, lepszym wyjściem może się okazać użycie [Platformy Crowdin](https://crowdin.com/project/spolszczenie-fnaf-sb/pl).\
> Ma wbudowane podpowiedzi i autokorektę tłumaczeń, oraz rozsądny darmowy limit ilości słów.\
> Jego konfiguracja wychodzi poza ramy tego poradnika i będziesz musiał/a sobie z tym poradzić na własną rękę!

Nie muszę raczej tłumaczyć procesu samego... Cóż, tłumaczenia xD

Jedyną radą jest to aby nie tłumaczyć tego, czego w grze nie widać lub co jest takie same po polsku, jak w oryginale np. liczby lub nazwy/skróty (RTX, HDR itp.)

# #4 Pakowanie plików :package:
Po ukończeniu spolszczenia należy przekonwertować plik z powrotem do formatu **.locres**, a następnie spakować do formatu **.pak**.
### 4.0 Folder roboczy :file_folder:
Przygotuj folder roboczy, wrzucając do niego program **UnrealLocres.exe**, dostępny do pobrania z folderu [**Narzedzia**](Narzedzia).
> [!IMPORTANT]
> Stwórz go w miejscu neutralnym np. na pulpicie albo w folderze pobrane. Ważne żeby nie kolidował z plikami gry!

### 4.1 Import do formatu .locres
Do folderu roboczego wrzucamy:
- Oryginalny plik .locres z plików gry
- Plik spolszczenia **z końcówką .po**!

Nastepnie w PowerShell wykonujemy komendę:\
```./UnrealLocres import Game.locres Game.po --format po``` \
(zakładając że nasz plik ma nazwę roboczą Game)

Program powinien teraz utworzyć nam plik **Game.locres.new** który jest oryginalnym plikiem, wzbogaconym o nasze zmiany!

### 4.2 Przygotowanie do pakowania
1. Wchodzimy do folderu FModela w którym bazowo exportowaliśmy nasz plik .locres!
2. Ważne jest teraz aby podmienić plik Game.locres w folderze **Localization** na końcu ścieżki, na ten który przed chwilą przekonwertowaliśmy.\
 Zachowaj jego oryginalną nazwę (usuwając .new z końcówki) i nie zmieniaj nic z folderami!
3. Wyjdź do folderu Exports i obok folderu z nazwą gry, utwórz nowy folder o dowolnej nazwie
4. Wrzuć tam folder z nazwą gry

### 4.3 Pakowanie i testowanie
1. W drugim oknie otwórz folder **Narzedzia** z repozytorium, i wejdź do folderu UnrealPak
2. Przeciągnij folder o dowolnej nazwie, na plik **"_UnrealPak-With-Compression.bat"** w folderze narzędzia
3. Powinien na chwilę otworzyć się wiersz polecenia, a twoim oczom ukazać się gotowy plik obok folderu Export.
4. Zmień nazwę pliku .pak tak żeby na końcu znajdowało się **_P.pak**
5. Przenieś to do folderu: Content -> Paks  w plikach gry i odpal grę :D

# Obsługa Polskich Znaków
FNAF SB oraz FNAF HW używają domyślnej czcionki z Unreal Engine która obsługuje Unicode, co oznacza że wspiera ona również polskie znaki!
