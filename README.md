#SMASH
SNIPPET MANAGER FROM BASH!

#What is Smash Snippets?
Smash stands for Snippets Manager from Bash. It transforms a keyword into its respective text previously recorded. Or, if there is no match for that keyword, Smash suggests to add a new one connecting the content from your clipboard (AKA ctrl-C) with the word where your text cursor is.

#How to Install
Open terminal and paste each line of the following:
```
$ git clone https://github.com/matepaiva/smash-snippets.git
$ cd smash-snippets
$ bash install.sh
```

After this, you can go on and remove this folder.

```
$ cd ..
$ rm -R smash-snippets
```

#How to use
To get the content from a keyword previously set, just write that word (**ANYWHERE!!!**) and press "<ctrl>,".

If the word has no candidate for snippet, a window confirmation will ask if you want to connect that word with your clipboard content.

Let's draw it:
![gif explanation](https://media.giphy.com/media/l2R78vpnmCjPfVJIs/giphy.gif)

Your snippets will be stored in a directory called "my-smash-snippets", just inside your user folder.

You also can change the Smash shortcut. In your system, visit: Keyboard > shortcuts > Custom shortcuts > Smash. 

#Todo
- Till now, there is no soft way to delete nor update the snippets. But, as they are simple text files, you can go to the folder (~/my-smash-snippets) and to what you need to do.
- Create a beautifull way to see all the keywords and it's content from command line.
- Remove bugs: not sure why, but it appears to have a bug when you write the word and quickly shut the Smash shortcut.
