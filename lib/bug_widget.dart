import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MovieDetailContent();
  }
}

class MovieDetailContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  child: Image.network(
                    'https://www.themoviedb.org/t/p/w1280/h4VB6m0RwcicVEZvzftYZyKXs6K.jpg',
                    fit: BoxFit.cover,
                  ),
                  height: 346,
                  width: double.infinity,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'A Movie Title',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '2022 • Action • 1h 45m',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            _RatingWidget(7.8),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Text(
                'A detailed description of movie',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            _CastWidget(),
          ],
        ),
      ),
    );
  }
}

class _CastWidget extends StatelessWidget {
  final List<String> _cast = ["Hello", "asdasd"];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
          child: Text(
            'Cast',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8),
          child: SizedBox(
            height: 128,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _cast.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(56)),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(_cast[index]),
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(width: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class _RatingWidget extends StatelessWidget {
  final double _rating;

  _RatingWidget(this._rating);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _rating.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Color(0xfffdc432)),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.star_rate_sharp,
              size: 16,
              color: Color(0xfffdc432),
            ),
            Icon(
              Icons.star_rate_sharp,
              size: 16,
              color: Color(0xfffdc432),
            ),
            Icon(
              Icons.star_rate_sharp,
              size: 16,
              color: Color(0xfffdc432),
            ),
            Icon(
              Icons.star_rate_sharp,
              size: 16,
              color: Color(0xfffdc432),
            ),
            Icon(
              Icons.star_rate_sharp,
              size: 16,
              color: Color(0xffa3a2a6),
            ),
          ],
        ),
      );
}

class MovieDetailParams {
  final int id;
  final String title;
  final String backdropUrl;

  MovieDetailParams(this.id, this.title, this.backdropUrl);
}
