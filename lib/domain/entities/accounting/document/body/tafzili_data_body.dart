class TafziliDataBody{
  final int tafziliGroupID;
   int tafziliID;

  TafziliDataBody({required this.tafziliGroupID, required this.tafziliID});

  void updateTafziliId({required int tafziliID}){
    this.tafziliID=tafziliID;
  }
}