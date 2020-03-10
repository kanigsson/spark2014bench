(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy1 (Array Int integer))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int (Array Int integer)))))))
(declare-fun slide1 ((Array Int (Array Int integer)) Int
  Int) (Array Int (Array Int integer)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int integer))))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int integer))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int (Array Int integer))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int integer))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155) 1 2
                              (select b (+ (- b__first a__first) temp___idx_155))
                              1 2) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int integer)))
  (b (Array Int (Array Int integer))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155) 1 2
     (select b (+ (- b__first a__first) temp___idx_155)) 1 2) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort ta2D1 0)

(declare-fun ta2D1qtint (ta2D1) Int)

;; ta2D1'axiom
  (assert
  (forall ((i ta2D1)) (and (<= 1 (ta2D1qtint i)) (<= (ta2D1qtint i) 2))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (ta2D1 ta2D1) Bool)

(declare-const dummy2 ta2D1)

(declare-datatypes ((ta2D1__ref 0))
(((ta2D1__refqtmk (ta2D1__content ta2D1)))))
(define-fun ta2D1__ref_ta2D1__content__projection ((a ta2D1__ref)) ta2D1 
  (ta2D1__content a))

(declare-fun temp_____aggregate_def_396 ((Array Int integer)
  (Array Int integer)) (Array Int (Array Int integer)))

(declare-fun temp_____aggregate_def_401 (Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_406 (Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_411 ((Array Int integer)
  (Array Int integer)) (Array Int (Array Int integer)))

(declare-fun temp_____aggregate_def_416 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_420 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_424 ((Array Int integer)
  (Array Int integer)) (Array Int (Array Int integer)))

(declare-fun temp_____aggregate_def_429 (Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_434 (Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_439 ((Array Int integer)
  (Array Int integer)) (Array Int (Array Int integer)))

(declare-fun temp_____aggregate_def_444 (Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_449 (Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_454 ((Array Int integer)
  (Array Int integer)) (Array Int (Array Int integer)))

(declare-fun temp_____aggregate_def_459 (Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_464 (Int Int) (Array Int integer))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 2))

;; def_axiom
  (assert
  (forall ((temp___403 Int) (temp___404 Int))
  (let ((temp___402 (temp_____aggregate_def_401 temp___403 temp___404)))
  (=>
  (and (dynamic_invariant temp___403 true true true true) (dynamic_invariant
  temp___404 true true true true))
  (and (= (to_rep (select temp___402 1)) temp___403)
  (= (select temp___402 2) rliteral))))))

;; def_axiom
  (assert
  (forall ((temp___398 (Array Int integer)) (temp___399 (Array Int integer)))
  (let ((temp___397 (temp_____aggregate_def_396 temp___398 temp___399)))
  (and (= (select temp___397 1) temp___398)
  (= (select temp___397 2) temp___399)))))

;; def_axiom
  (assert
  (forall ((temp___408 Int) (temp___409 Int))
  (let ((temp___407 (temp_____aggregate_def_406 temp___408 temp___409)))
  (=>
  (and (dynamic_invariant temp___408 true true true true) (dynamic_invariant
  temp___409 true true true true))
  (and (= (to_rep (select temp___407 1)) temp___408)
  (= (select temp___407 2) rliteral))))))

;; def_axiom
  (assert
  (forall ((temp___413 (Array Int integer)) (temp___414 (Array Int integer)))
  (let ((temp___412 (temp_____aggregate_def_411 temp___413 temp___414)))
  (forall ((temp___415 Int))
  (ite (= temp___415 2) (= (select temp___412 temp___415) temp___413)
  (= (select temp___412 temp___415) temp___414))))))

;; def_axiom
  (assert
  (forall ((temp___418 Int))
  (=> (dynamic_invariant temp___418 true true true true)
  (forall ((temp___419 Int))
  (= (to_rep (select (temp_____aggregate_def_416 temp___418) temp___419)) temp___418)))))

;; def_axiom
  (assert
  (forall ((temp___422 Int))
  (=> (dynamic_invariant temp___422 true true true true)
  (forall ((temp___423 Int))
  (= (to_rep (select (temp_____aggregate_def_420 temp___422) temp___423)) temp___422)))))

;; def_axiom
  (assert
  (forall ((temp___431 Int) (temp___432 Int))
  (let ((temp___430 (temp_____aggregate_def_429 temp___431 temp___432)))
  (=>
  (and (dynamic_invariant temp___431 true true true true) (dynamic_invariant
  temp___432 true true true true))
  (forall ((temp___433 Int))
  (ite (= temp___433 1)
  (= (to_rep (select temp___430 temp___433)) temp___431)
  (= (to_rep (select temp___430 temp___433)) temp___432)))))))

;; def_axiom
  (assert
  (forall ((temp___426 (Array Int integer)) (temp___427 (Array Int integer)))
  (let ((temp___425 (temp_____aggregate_def_424 temp___426 temp___427)))
  (and (= (select temp___425 1) temp___426)
  (= (select temp___425 2) temp___427)))))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 1))

;; def_axiom
  (assert
  (forall ((temp___436 Int) (temp___437 Int))
  (let ((temp___435 (temp_____aggregate_def_434 temp___436 temp___437)))
  (=>
  (and (dynamic_invariant temp___436 true true true true) (dynamic_invariant
  temp___437 true true true true))
  (forall ((temp___438 Int))
  (ite (= temp___438 1) (= (select temp___435 temp___438) rliteral1)
  (= (to_rep (select temp___435 temp___438)) temp___437)))))))

;; def_axiom
  (assert
  (forall ((temp___441 (Array Int integer)) (temp___442 (Array Int integer)))
  (let ((temp___440 (temp_____aggregate_def_439 temp___441 temp___442)))
  (and (= (select temp___440 1) temp___441)
  (= (select temp___440 2) temp___442)))))

;; def_axiom
  (assert
  (forall ((temp___446 Int) (temp___447 Int))
  (let ((temp___445 (temp_____aggregate_def_444 temp___446 temp___447)))
  (=>
  (and (dynamic_invariant temp___446 true true true true) (dynamic_invariant
  temp___447 true true true true))
  (forall ((temp___448 Int))
  (ite (= temp___448 1) (= (select temp___445 temp___448) rliteral)
  (= (to_rep (select temp___445 temp___448)) temp___447)))))))

;; def_axiom
  (assert
  (forall ((temp___451 Int) (temp___452 Int))
  (let ((temp___450 (temp_____aggregate_def_449 temp___451 temp___452)))
  (=>
  (and (dynamic_invariant temp___451 true true true true) (dynamic_invariant
  temp___452 true true true true))
  (forall ((temp___453 Int))
  (ite (= temp___453 1) (= (select temp___450 temp___453) rliteral)
  (= (to_rep (select temp___450 temp___453)) temp___452)))))))

;; def_axiom
  (assert
  (forall ((temp___456 (Array Int integer)) (temp___457 (Array Int integer)))
  (let ((temp___455 (temp_____aggregate_def_454 temp___456 temp___457)))
  (and (= (select temp___455 2) temp___456)
  (= (select temp___455 1) temp___457)))))

;; def_axiom
  (assert
  (forall ((temp___461 Int) (temp___462 Int))
  (let ((temp___460 (temp_____aggregate_def_459 temp___461 temp___462)))
  (=>
  (and (dynamic_invariant temp___461 true true true true) (dynamic_invariant
  temp___462 true true true true))
  (forall ((temp___463 Int))
  (ite (= temp___463 1) (= (select temp___460 temp___463) rliteral)
  (= (to_rep (select temp___460 temp___463)) temp___462)))))))

;; def_axiom
  (assert
  (forall ((temp___466 Int) (temp___467 Int))
  (let ((temp___465 (temp_____aggregate_def_464 temp___466 temp___467)))
  (=>
  (and (dynamic_invariant temp___466 true true true true) (dynamic_invariant
  temp___467 true true true true))
  (forall ((temp___468 Int))
  (ite (= temp___468 2) (= (select temp___465 temp___468) rliteral)
  (= (to_rep (select temp___465 temp___468)) temp___467)))))))

(assert
;; defqtvc
 ;; File "arr_aggregate.ads", line 22, characters 0-0
  (not
  (forall ((one Int) (a (Array Int (Array Int integer))) (usf Int))
  (=> (dynamic_invariant one true false true true)
  (=> (dynamic_invariant b true false true true)
  (=> (= one 1)
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= b 1) true false))
  (ite (= spark__branch true)
  (= a (temp_____aggregate_def_396 (temp_____aggregate_def_401 one 2)
       (temp_____aggregate_def_406 one 2)))
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= b 2) true false))
  (ite (= spark__branch1 true)
  (= a (temp_____aggregate_def_411 (temp_____aggregate_def_416 one)
       (temp_____aggregate_def_420 one)))
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (= b 3) true false))
  (ite (= spark__branch2 true)
  (= a (temp_____aggregate_def_424 (temp_____aggregate_def_429 one one)
       (temp_____aggregate_def_434 1 one)))
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= b 4) true false))
  (ite (= spark__branch3 true)
  (= a (temp_____aggregate_def_439 (temp_____aggregate_def_444 2 one)
       (temp_____aggregate_def_449 2 one)))
  (= a (temp_____aggregate_def_454 (temp_____aggregate_def_459 2 one)
       (temp_____aggregate_def_464 2 one)))))))))))))))
  (=> (not (= b 1))
  (=> (not (= b 2))
  (=> (not (= b 3))
  (=> (= b 4)
  (=> (= (and (ite (<= 1 usf) true false) (ite (<= usf 2) true false)) true)
  (<= 1 one)))))))))))))
(check-sat)
(exit)
