/**
* 'busyBox' v1.0
* @author Roger Padilla C. - rogerjose81@gmail.com
* @license BSD
*/
(function ($) {

    /**
    * Main function; used to initialize the plugin or for calling the available functionalities of the plugin (such as 'open' or 'close').
    * The 'arguments' array is used to obtain the received parameters
    */
    $.fn.busyBox = function () {

        $.fn.busyBox.self = this;

        if (arguments[0] == 'open') {
            $.fn.busyBox.open();
        } else if (arguments[0] == 'close') {
            $.fn.busyBox.close();
        } else {
            $.fn.busyBox.init(arguments[0]);
        }

        return this;
    };

    /**
    * Initialize the plugin using the passed options
    */
    $.fn.busyBox.init = function (options) {

        $.fn.busyBox.opts = $.extend({}, $.fn.busyBox.defaults, options);

        // Adds the default classes if they are not present in the passed classes
        if ($.fn.busyBox.opts.classes.indexOf($.fn.busyBox.defaults.classes) === -1) {
            $.fn.busyBox.opts.classes += ' ' + $.fn.busyBox.defaults.classes;
        }

        $.fn.busyBox.container = $(document.body);

        if ($.fn.busyBox.opts.autoOpen) {
            $.fn.busyBox.open();
        }
    };

    /**
    * Display all the 'busyBoxes' over the matched boxes
    */
    $.fn.busyBox.open = function () {

        var box, inner, e, bOffset, bWidth, bHeight, iTop, iLeft;

        $.fn.busyBox.self.each(function (index) {

            e = $(this);
            bWidth = e.outerWidth();
            bHeight = e.outerHeight();
            bOffset = e.offset();

            box = $('<div />');
            box.attr('id', 'busy_box_' + index);
            box.addClass($.fn.busyBox.opts.classes);

            box.css({
                width: bWidth,
                height: bHeight,
                padding: 0,
                margin: 0,
                position: 'absolute',
                top: bOffset.top,
                left: -9999, // Used to not display the box yet without hidden it (needed to be able to calculate its dimensions)
                zIndex: $.fn.busyBox.opts.zIndex,
                opacity: $.fn.busyBox.opts.opacity,
                color: $.fn.busyBox.opts.color,
                backgroundColor: $.fn.busyBox.opts.backgroundColor
            });

            inner = $($.fn.busyBox.opts.spinner);
            inner.attr('id', 'busy_box_spinner_' + index);
            inner.addClass('busy-box-spinner');

            box.append(inner);

            $.fn.busyBox.container.append(box);

            // Set the position of the inner message inside its parent. Calculates the 'top' and/or 'left' coordinates of the inner-message (inside its parent) if those properties were configured as 'auto'
            iTop = ($.fn.busyBox.opts.top == 'auto' ? ((bHeight / 2) - (inner.outerHeight() / 2)) + 'px' : $.fn.busyBox.opts.top);
            iLeft = ($.fn.busyBox.opts.left == 'auto' ? ((bWidth / 2) - (inner.outerWidth() / 2)) + 'px' : $.fn.busyBox.opts.left);

            inner.css({
                position: 'absolute',
                top: iTop,
                left: iLeft,
                opacity: 1.0
            });

            // Relocate and hidde the 'busyBox' (previously displayed using a negative left-coord to be able to calculate its dimensions)
            box.css({ left: bOffset.left, display: 'none' });
        });

        // Display all the 'busyBoxes'
        $.fn.busyBox.container.find('div.' + $.fn.busyBox.defaults.classes).fadeIn('fast');
    };

    /**
    * Closes all the 'busyBoxes' being showed
    */
    $.fn.busyBox.close = function () {
        $.fn.busyBox.container.find('div.' + $.fn.busyBox.defaults.classes).fadeOut('fast', function () {
            $(this).remove();
        });
    };

    /**
    * Default configuration
    */
    $.fn.busyBox.defaults = {
        autoOpen: true,
        spinner: '<em>Cargando&#8230;</em>',
        classes: 'busy-box',
        zIndex: 999,
        opacity: 0.5,
        top: 'auto',
        left: 'auto',
        color: '#fff',
        backgroundColor: '#666'
    };

})(jQuery);