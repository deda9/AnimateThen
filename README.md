# AnimateThen
Its Sweety syntax to queue animations for the view either Async or Sync

In short, it allows you to replace this:

```Swift
UIView.animate(withDuration: 0.5, animations: {
            self.squareView.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)

            UIView.animate(withDuration: 1.0, animations: {
                self.squareView.transform = CGAffineTransform.identity
                
                UIView.animate(withDuration: 2.0, animations: {
                    self.squareView.transform = CGAffineTransform.identity
                     self.squareView.alpha = 0.5
                })
                .....
            })
        })

````

with this sweety syntax
```Swift
animate { self.squareView.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0) }
	.then { self.squareView.transform = CGAffineTransform.identity }
	.duration(1)
	.then { self.squareView.alpha = 0.5 }
	.duration(2)
	.then { self.squareView.alpha = 1 }
	.delay(0.4)
	.then { self.squareView.backgroundColor = UIColor.red }
	.duration(0.8)
	.delay(0.2)
	.completion { _ in self.squareView.backgroundColor = UIColor.green }
	.sync()

````


and 
```Swift
UIView.animate(withDuration: 0.5, animations: {
	self.squareView.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)
 })
        
UIView.animate(withDuration: 1.0, animations: {
	self.squareView.transform = CGAffineTransform.identity
})
        
UIView.animate(withDuration: 2.0, animations: {
	self.squareView.transform = CGAffineTransform.identity
	self.squareView.alpha = 0.5
})
....

````

with this sweety syntax
```Swift
animate { self.squareView.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0) }
	.then { self.squareView.transform = CGAffineTransform.identity }
	.duration(1)
	.then { self.squareView.alpha = 0.5 }
	.duration(2)
	.then { self.squareView.alpha = 1 }
	.delay(0.4)
	.then { self.squareView.backgroundColor = UIColor.red }
	.duration(0.8)
	.delay(0.2)
	.completion { _ in self.squareView.backgroundColor = UIColor.green }
	.async()

````



