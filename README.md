# Shipd Style

Shipd Style is a gem for building responsive web design. It can be used on its own, but it is also a component of the front end framework: [Prow](https://github.com/shipd/prow) which allows a full-extensible front-end build out without the need of a server.

Ship has a series of HTML demonstration pages for checking out all the responsive CSS3 goodness that Shipd Style has to offer.

## Installation

Add this line to your application's Gemfile:

    gem 'shipd_style'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'shipd_style'

## Usage

### Usage with just Compass

Install compass:

    gem install 'compass'

Run the compass command line tool to create a new application in the directory of your choosing:

    compass init

### Use With Rails


## Concepts

Getting CSS right for a responsive design that really looks different on different devices can be quite tedious. Over the last three years, we have reinventing this wheel again and again. It is now smaller, rounder and easier to use than ever.

### Life without Responsive Design
Shipd Style is inspired by Stubornella's great framework [OOCSS](https://github.com/stubornella/oocss). We grabbed some of her core concepts about grids, single responsibility classes and divs, and we ran with it. It may be nothing like what she would recognize, but here are our guiding principles, which when mastered, make for great productivity:

__Rows & Units__
Layouts are broken into `.row`s. These rows contain any number of elements that float around, either left or right.

__IMPORTANT:__ _Rows and units can't have padding or margin._ Instead there divs are single responsibility, having either this row/unit width characteristic ... or they have padding and margin.

A typical structure looks like this:

    <div class='row'>
      <div class='inner border'>
        <div class='unit size-1-2'>1/2 sized</div>
        <div class='unit size-1-3'>1/3 sized</div>
        <div class='unit-last'>the rest</div>
      </div>
    </div>

The row has an `inner` that provides padding. That div that also has a border. Borders take up width. Instead of doing lots of crazy CSS math that goes wrong all the time, padding, margin, outline and border goes on another div ... single responsibility divs.

### Getting Responsive
This is all grand, but it happens often that we want a row in mobile view to be a 1/2 sized column in tablet, and 1/3 sized in desktop. Shipd Styles to the rescue. It turns out there are styles to do just that:

    <div class='m-row t-unit d-unit t-size-1-2 d-size-1-3'>
      <div class='m-row t-hidden d-hidden'>
        I'm a mobile row
      </div>
      <div class='m-hidden t-row d-hidden'>
        I'm a tablet half sized column
      </div>
      <div class='m-hidden t-hidden d-row'>
        I'm a desktop 1/3 sized column
      </div>
    </div>

In this example, there is different content per layout that is hidden via some convenient styles. Completely different content per layout should be reserved for changing the order of content, or totally different content.

Full documentation of all the classes coming soon.

## Contributing

1. Fork it ( https://github.com/shipd/shipd-style/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
