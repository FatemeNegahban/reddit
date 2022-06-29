import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Search_page.dart';
import 'Feed_Cubit.dart';



class FeedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Search")),
           actions: [
             /*BackButton(
               color: Colors.blueGrey,
             ),*/
             IconButton(
           onPressed: () =>
           Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchPage())), icon: Icon(Icons.search),
           )
            ],
      ),
        body: _postsListView(context),
        );
  }

  Widget _postAuthorRow(BuildContext context) {
    const double avatarDiameter = 44;
    return GestureDetector(
      onTap: () => BlocProvider.of<FeedNavigatorCubit>(context).showProfile(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter / 2),
                child: Image(
                  image: NetworkImage('data:image/jpeg;base64,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'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            'Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _postImage() {
    return AspectRatio(
      aspectRatio: 2,
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgVFhUYGRgaGBgYGhoaGhgaHBgYGBgaGhgYGBocIS4lHB4rIRgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhISGDQhGB0xMTExNDExNDQxNDQxNDQ0NDE0NDQ0NDQ0MTQxMTQ0NDQ/MTQ0PzRANDQ0NDQ0PzE/P//AABEIAN8A4gMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAEBQIDBgEABwj/xAA+EAACAQIDBQQIBAQGAwEAAAABAgADEQQhMQUSQVFhInGBkQYTMqGxwdHwFEJSYhVyguEHIyRTkrIzwtIW/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT/xAAcEQEBAQEBAQEBAQAAAAAAAAAAARECMSESQVH/2gAMAwEAAhEDEQA/ANKDJBopp7dw50qr43HxhdLG029l0PcwnB6MGAyQeUq0leEXhp0ESlGkg0C4MJIGUgiTVoFoM6GzlYaSTPSBMNJ3vA6+NRLgtc8hn/aL6+3crIoHVu15DSTVyntp6ZhdtVb33/DdW3whC+kbgZohPMr9LRqfloZ1TMx/+kqE5EDoFW3whB2+9tF791Y0/NaJTJgzLfxqqTkwH9K/SPdk4v1qG/trmeG8OYHOWUswwBlqNB1MsUwCVMtVoMrS1WlQSjSwGDK8tV4SxYwkSts51Wkr3mpWLFd50HpJ7s5uzWmI+s6T0lYz0aY/OG7PBZze6SStPO9axHZdGYdxI+EKpbSrrpVfzv8AGBgzoaA1p7fxI/PfvVT8oTS9J641VG8CPgYjDSdJCzBVUsToALkwmRpU9LG40h4MR8RCU9Lk/Mjju3T9IHhPR+w3qxI/Ylr/ANTaDwh2Gr0qZ7NBBbiV3mv/ADNcy/WbhlQ2wjrvBHA4F1IB7jxi/FbWchs7DQAQbam0i542GkVV6nYMqJ0MVcnPjLjWmZGIKnIw+ljbiMNOFqwbE4qwgTYuA4vEXjA6wWIuIwFW0zeBr5WjEVjJYQ6SuLRjsXaYSoOHWZqnUtJ4bEDfAgv19WqoCN5fZOo/SfpK1aZ7Ze3tw2Oa6G/ER96xGAdGup81PIzWs4vDS1Ggt5NXgFqZYrQZHlitCL1MsBlCGSDSi8NJXlAaSDS6mLJ6Q3p6NTH50VbT1jeTvJCcnpQ3Z1Vkp20g5uTRYOkKSFR7bDtNy/aOg98UYDCs75aDNidAL/GOMSpPaGvKWJaATazI245MufFA5iB46iHXkw0+kQDEMuV5rGGkapAto4kKtr6xdSxBOd4JjjvkE+yvDmfpLIlqqpis8pKnjLcYM1EnQdw6c5JcCb3PlNfGfo4Ysc5TWr3glTDkHLKQam3OMhtMsNiLcYbQ2hbWIV3h1ljq1r28IsJWnONuMpds0kln8B8T8pl6T/zeBmk2TlTBzzJOeszZjUunCVusY7NxxB3T2kYbrr+pTr48R1iFnjLZwIIJmVSxavRqMiu4sciGIupzU5HiCJdS2vXXSs/ib/GS9KU7VKoNHphb82QkH3FYlFQzNdZ9jTYb0mrra5VxyYAe8TV7K2sldSVyK+0p1HUHiJ80SrHHoviiuIQXya6nusT8QI56us9czH0ZWlivBkeTV50cRIM6DBy8Vj0hTfZPVklScwwzANr2lD289FH8eX/bf3T0D4cBJWMkAJ605u6IJkg0kDPSDVYDDIlBd42Z+0xtxOgPcJU9NlNwbjmJY73XdbQgeBtqIsd2QlSf7jnNMJ4m2syO0GG+e+PcbibCZjEPc3muWakHPPLl9YQlEkXGvKVYSjvZDX7847wuGuBlbKW1J9C0cOeUJbD5Xl6UiDa2V4wxNIBCbcJm1cIlwqnPiIG2GudPu8bFd1L8TK1S9unylUufC5j4S1kENoUS12MGrZZfesABxnf7yjzZT71McwSD53EUVU89PfLtlV9193mPePsxUjS0KC8TGdOnfMaRLTc3jTA1rMJFNdrUt/B7wFzScN3K/Zb37kyt59F2Vh1dXpN7NRCvcToRfiCL+EwGJwrU3ZGFmRip7xMdN83+Kd+N/Rk/6mn/ADH/AKmKbRt6Mj/Up/V/0aSNdePoqvJq8oVp3fnVwXu+RmGq1B6128PebzYtUymQxuxHLFg4sSTYrzgUfj05z0D/AII/6h5f3nYGTkgZET15zd051F3iFHEgeZtIK0M2al6qA87+QJ+UId12sbQLG9pL8Vz8OIjBsMdSYBiKo0E25sxtSvw5wWjhA4BN5DaoPrAg4X/tDsNhzbWa8ie0bg8OtgNbdY1w9Ox4xFVxb0xYARPX2vWLHdcgdJJLS2Ru6idpeRIndpt2JkMD6QuhAqWZTx0I69ZqXcMAdQbEd0WWEugMS3ZUDu8tZFE7JI10+stqpn8vCeUbvSRRVBN1B3RYlDezvGL1brlKUAUWLC/UwFtbDBeMCA3WBBzBvGtZCeRi+olj8pYlh9hGuLw6kYDhVsqjoIag0kVtNhV7BD18Yi9N03cTvWtvoj+OaH/pDtktkveJz/EKnnh3H6XXyYG3vkviz1kN+N/Rdv8AUp3N/wBTEhBjn0UX/UA/sf4TM9dOvG+QyW9KUeStOjgsMGxHKXAweo1zAG3J6SnpB8mBlg62++6UhZJV6zDusZRzPl/eHbFUetHa0DG1iOFouLkaW8ox2K53zcLkhzGR1A4d8qXw5xZYjLSI6hzjtyLZRHiGNzcX7tRNOZNi6N629+0fOMaNKCb4apk2gtY5HzhyVLcD4xUijHYMulhrwmWxFB0PaQjrbLzGU3tN78vnJerBl56xOudfPFu2Sgk9JvMAlqKKxzCqPISx8NyHuEiFtqY66055xW5z8JWiFjLqjiDiqZGgO28eUG4hsbZniB0mZsTmWN+ZJjnaWBdyWXM8ooag4Nijf8TOnOY59asoY11yDE9DneOcIzVFuwsIv2dst2beZd0ddT3CaFVCiwyAyk6sXmUbTbIQ9DpFuCN7dBn3w1aomG2p2QL27xGfpnQ38HvgZpUDX6N2T72XyinYlTsb3KaaopqYV6fF0f8A5WuPeBIf18p3469FW/zj/I3yiEx36KH/ADm/kb4iZnrr15W3QyZeUo0kTOjgkzylmkryt2gxHenpGegfKRJZd85adnN2d3h+n3mH7FYb7Dd/IeJ5rzi60J2c+7VQ8Cd0/wBQt8bQXw93hmJn9pHdc9q3eDb3Xmleitr3mf29h7jeH5de6bjnSN6h3xfdYdGU+Skh/fHGFdSLFSByN/npM1iEJ0hWAxLjK9h3ge4zVnxmX61qUUIvbxBtCEpDgRE2GxX7h8YwpYkch33mWhtSl2T3TF4mtUR2BY3ue602JxGUR7VoK9uBuM4hChNpne3WIjjDUiyg89JZg9lUwBdQT1jUooFtAIoXrQtrIugGdoVUHL3GBPUYZMLd9vjAiz5aSmowPGcLG9hvE8BaGUNnMc37PTUwKsPktgDds4ww2HIzbXlLadJV0EupLc3gO8D2U3eeZ75o9lYjNRwvMmjnLpHWyao317xIMl6V4P1OJdVFkbtqOQYm48GDDwl3ok16rn9nzEdf4g4UsiVhorbrdFcBlPdvbw/qiP0R/wDI/wDIPjJn1vd5bNJ0tKladLTbklvSDHOe3pEmB2ekbz0D5YKi8x5yauOYkCo5CcNNeQmHZaBO7sp9SvKe/Dr9kyDV4eoHQE8R5MNffA8TRIyIl+xdmutEub7pYEXNyOF+7SFgbwsZqMVgtq4MobjNT7ukUnIzf43Bggi2R1BmI2nhdxyvDUd03zWOolRrHgYdSxRiRHtCqdWWxNOlxTnSRdXvcm8GoYoCHrU3gLAnuF5mtSrMHj87HIxi2KuOB+84sbZrvoLDmcv7xhhNkhbb7l+mg+sfFV75b2Uv0vlaXU8Cx9o26A38M8owQACwAAkHeQcSiqDIWnHaec5d/wBJIJpeQRpoTCgljYafIysSb1OA5D4Qq1XzsI72P7V+WnfEGH5xxRxARSfsmEPsXRWstShkd+nYdGFyh8wJhvRRSHqAjMAA9Dc3E1+BqkVA3RPeASPfE7YQ08XicuyzB17nux8iSPCDfhmrTt5QtSdNSaZWFpxmlJeRZ4BF52Db87IHlTZ9Nr3RD3qIvxHo1hnvekoP7br8I5vOMZGmWqehdA6F18b/ABg1L0PRainfLgG5UgeF7TVVHzsNTJKtu/nGG178IgQpbIi0xWIplGKnUEjym7QcZkdvpas/gfcJSUrZ76+czfpTgrpv29k3v0Os0DyN75HMHUHMHvES4Wa+Xb2cNwmFdzZchz4D6zX4r0ZoOd5AUP6QeyfDh4TyYVafZ3bfDwm71P4xOf8AQuB2SigFhvHr9I3poALAAQcVhoJJakw3IK9ZPF5RvSQaQWkziiQ35NGhVhte3ITzGREi9VRqwhFm/wAJ5YI2KH5RfqZ1d5jn/aCmFOqNBmYVhj6xwoPZHv4kxW77g3RqdTyHKaH0ewnYZ7ftHzgH4Ne3fmZpkRHBR1BzOuuvCIMOvaGXGO9n0VZ3c57rEAcMwM5YlZnauFai+6fZOanpy74D6/rN5tDZqV0KuDzVlyZTzU/LSfL/AElwuIwTXdS9Ins1VuB/K4/K3uPCVJ9Mmr9Zw1usz+G2vTf85U8my98YqhYXV7joZNa/NHev6z0C/Dt+qej9Q/NbqpXAgdTEkmwkK1W87hqd5ARRTz4mFU1kUAEizlshkJRdvcBn1mT2+CKzdyn3TWU7DSZj0oH+aDzQfEwkI6glJEJbSU6QqsXll7jdYXHIy9GB4SfqQYGd2jgmS7oCyjMjVl6jmIHh8WGFwZrjStM1t/YbG9SjcNqyD83VevSIlcbGKupAkP4onC57h9ZmEc8b34318YTScS/lJ0ejah4IPEzpxrnjbuEX0CDDESFiZqM2rEyynSkkQQlAJFSoUIVvbosPOVq88TAr3bmbXZOKVKSr338ZijikU63PIZn3Q3D4iq9lRCAeLHPyEDXpiRvZcxH2yG9u+d3MyuytkYgsC5QC4yub/CbDAUGRbEC5JYkHiTpESmINpXXpq6lXUMrAhlYAgg6ggyKhuVvEmS3jxlZx8r9Kf8NSm/VwhuubepbUDiEbj3HzmAw+JdD2WKkfdrT9JOcp8s9PfQdgzYnDLdWO9UpjVT+Z0HEHiPGStc9Mf/Hq36h5T0V+pPMeY+s9GN6+z4alvG50h4y0E8lGw/SPvWVtU5SMp72es76wDUwWpWAzi/E4u9woMqSGNfaO5wvM9tbF+ssbZi8JXDO2pt3wHGYUIPaBudOUihgbiVvIK9jb7vJNKIAy5K8paQEhDJKoloAMUK8Ip1SIAW1fRlKjb6izHWxsG6kc+sWDYaLkRn1vNXTryyrSRx2teY1l2pkZX+FJ+nyvBMTgWUXVm8TeafEYUpnqOch+HVxY+BjVZJBU/WfIfSGpQrHR1/4/3jKps4oe0MuBGktpLYxpgCns6q2tW3cAPjeG0NjKPbZ3/mPyhKtD6FVeMaOYLYyXyFvlNNgNnqLWtvfdiIqw9ZQCB9+EuGINrjUZ+HGRT5Ljr8xCVxB0JuD95GJcNtPeFm84clW+Ry5ESoYriWFiCSORhVHFBukUDEhcmvbmLEeOdwZFqgGYYW6ys40N54xThsdu5G9usOGLWDE/wqf7af8AFfpPSP4tfu85CYy4rFtTOVKgEHNTgBB69cL1My2JftanKDPiETSxMW4jHE/SL61QwD8XtFjexieli2ZyDpbOdNNjIMVQZa3uesoIqi8jTqcDr8ZUmIF5KokC5jIESFOpwOssvAjJo0jaeJgFUmhlNoqR4TSrWkDVH4HMSqpgPzJ37v8A8/SdoVQYVTBEABHvdWHeCJXiNlkjep5814ju5xy+FV9cmtkw4d44iL3apQbtaH2WGjDp9ICWxGRBB4idWpNOfU4kWbsPbJvrziTaOynpe0LrwcZqfoekCqnXtxhKYu335xZeSVpQ2XFgHKWUsaRxNom3pL1p5wNNh9pDQkefytLvxQvqGB62t5iZQvnrJjFnjA1Ixe7kdOd8xLf4iwGsy648kfZ+M8MadLwNL/EPvenpnPX9Z6A1qvA6gHOSqVYK7mDHmRZSUUThMgzwIVmyivFKc7Rg7XlLiE9Jkqm1uIh+FxW8LGUYnDcRrFxcob+Y+kvqeH7iSWoRF+Exotrce8Q4EGRpcrzt4OROpU5wLryStIAgz0AulUtHGFxQsLzPK0tp1DINvhijcgYTUwSupRwGQ/HnfgZjsPjCOM0GB2wNDqPIwEe1cA+GcalCey3/AKt1l2C2u6ZXuvFTmD4TV1Gp10KOAQRn9Zidt7HfDHezelwcfl6PbTvgNKmzaOJF6ZWnU5X7DeH5T3ZTO47CPSfcqIVPuI5qeIlmGx9s1M1WA2ildPVV1DDhfh3HgYGJ3p7emg2x6LOl3pEulr/uXvHEdRM86Eayjpac3pECWBbwlcDSW9K92dBMGLrz0qznoU4dxBmqSbLeVOkCtqkrZp4pINA4ZCeM5A4ywPE4QNDGaQgwlfCshuJZRxpU29xjR1vBK2HB4RqZgqjiFcZGTMSVMMVN0NjLaO0yMqg/qHzEYaa3tLEq85QrhhcaHScMKNVpNYAr2l6VYDCnaHU7Dp1ihHjjZ1UEhTIDkqspBF4xw+POYbNTkQcwRxFjrLMLgUMarstDpAwe39jrTPrqI7BzZf0E8R0+EDwuItmJvsfsnsniM7jpPmOOw7UKpX8pN1z0HLwgb3Y22DYAnSXbU2JTrjfp2V+I4MefQzG4SvoZptn7T74GbxuzXpsVZSIGgINp9KstVbML9TM1tDZgBJEozwSF0MLeeNO0JoAwO/gek9L7NzPnOSD/2Q=='),
      ),
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
          'you did that girl*-*'),
    );
  }

  Widget _postView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(context),
        _postImage(),
        _postCaption(),
        //_postCommentsButton(context),
      ],
    );
  }

  /*Widget _postCommentsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () =>
            BlocProvider.of<FeedNavigatorCubit>(context).showComments(),
        child: Text(
          'View Comments',
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
      ),
    );
  }*/

  Widget _postsListView(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return _postView(context);
        });
  }
}