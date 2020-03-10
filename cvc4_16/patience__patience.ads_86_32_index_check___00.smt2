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

(declare-sort cardindex 0)

(declare-fun cardindexqtint (cardindex) Int)

;; cardindex'axiom
  (assert
  (forall ((i cardindex))
  (and (<= (- 1) (cardindexqtint i)) (<= (cardindexqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 1) x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (cardindex cardindex) Bool)

(declare-const dummy1 cardindex)

(declare-datatypes ((cardindex__ref 0))
(((cardindex__refqtmk (cardindex__content cardindex)))))
(define-fun cardindex__ref_cardindex__content__projection ((a cardindex__ref)) cardindex 
  (cardindex__content a))

(define-fun to_rep ((x cardindex)) Int (cardindexqtint x))

(declare-fun of_rep (Int) cardindex)

;; inversion_axiom
  (assert
  (forall ((x cardindex))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x cardindex)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort card1 0)

(declare-fun cardqtint (card1) Int)

;; card'axiom
  (assert
  (forall ((i card1)) (and (<= 1 (cardqtint i)) (<= (cardqtint i) 52))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 52)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (card1 card1) Bool)

(declare-const dummy2 card1)

(declare-datatypes ((card__ref 0))
(((card__refqtmk (card__content card1)))))
(define-fun card__ref_card__content__projection ((a card__ref)) card1 
  (card__content a))

(define-fun to_rep1 ((x card1)) Int (cardqtint x))

(declare-fun of_rep1 (Int) card1)

;; inversion_axiom
  (assert
  (forall ((x card1))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x card1)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int card1))))))
(declare-fun slide ((Array Int card1) Int Int) (Array Int card1))

;; slide_eq
  (assert
  (forall ((a (Array Int card1)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int card1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int card1)) (a__first Int) (a__last Int)
  (b (Array Int card1)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int card1)) (b (Array Int card1)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy3 (Array Int card1))

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

(declare-fun user_eq3 ((Array Int card1) (Array Int card1)) Bool)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int cardindex))))))
(declare-fun slide1 ((Array Int cardindex) Int Int) (Array Int cardindex))

;; slide_eq
  (assert
  (forall ((a (Array Int cardindex)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int cardindex)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int cardindex)) (a__first Int) (a__last Int)
  (b (Array Int cardindex)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int cardindex)) (b (Array Int cardindex)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const dummy4 (Array Int cardindex))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq4 ((Array Int cardindex) (Array Int cardindex)) Bool)

(declare-datatypes ((map__ref2 0))
(((map__refqtmk2 (map__content2 (Array Int (Array Int cardindex)))))))
(declare-fun slide2 ((Array Int (Array Int cardindex)) Int
  Int) (Array Int (Array Int cardindex)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int cardindex))))
  (forall ((first Int))
  (! (= (slide2 a first first) a) :pattern ((slide2 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int cardindex))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide2 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide2 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int (Array Int cardindex))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int cardindex))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (bool_eq1 (select a temp___idx_156) 0 99
                              (select b (+ (- b__first a__first) temp___idx_156))
                              0 99) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int cardindex)))
  (b (Array Int (Array Int cardindex))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (bool_eq1 (select a temp___idx_156) 0 99
     (select b (+ (- b__first a__first) temp___idx_156)) 0 99) true))))))))

(declare-const dummy5 (Array Int (Array Int cardindex)))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq5 ((Array Int (Array Int cardindex))
  (Array Int (Array Int cardindex))) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__patience__state__numelts cardindex)(rec__patience__state__values (Array Int card1))(rec__patience__state__numstacks cardindex)(rec__patience__state__stacksizes (Array Int cardindex))(rec__patience__state__stacks (Array Int (Array Int cardindex)))(rec__patience__state__posstack (Array Int cardindex))(rec__patience__state__posheight (Array Int cardindex))(rec__patience__state__preds (Array Int cardindex))))))
(define-fun us_split_fields_rec__patience__state__numelts__projection ((a us_split_fields)) cardindex 
  (rec__patience__state__numelts a))

(define-fun us_split_fields_rec__patience__state__values__projection ((a us_split_fields)) (Array Int card1) 
  (rec__patience__state__values a))

(define-fun us_split_fields_rec__patience__state__numstacks__projection ((a us_split_fields)) cardindex 
  (rec__patience__state__numstacks a))

(define-fun us_split_fields_rec__patience__state__stacksizes__projection ((a us_split_fields)) (Array Int cardindex) 
  (rec__patience__state__stacksizes a))

(define-fun us_split_fields_rec__patience__state__stacks__projection ((a us_split_fields)) (Array Int (Array Int cardindex)) 
  (rec__patience__state__stacks a))

(define-fun us_split_fields_rec__patience__state__posstack__projection ((a us_split_fields)) (Array Int cardindex) 
  (rec__patience__state__posstack a))

(define-fun us_split_fields_rec__patience__state__posheight__projection ((a us_split_fields)) (Array Int cardindex) 
  (rec__patience__state__posheight a))

(define-fun us_split_fields_rec__patience__state__preds__projection ((a us_split_fields)) (Array Int cardindex) 
  (rec__patience__state__preds a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq3 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__patience__state__numelts
                           (us_split_fields1 a))) (to_rep
                                                  (rec__patience__state__numelts
                                                  (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__patience__state__values
                           (us_split_fields1 a)) 0 99
                           (rec__patience__state__values
                           (us_split_fields1 b)) 0 99) true))
                        (and
                        (and
                        (and
                        (= (to_rep
                           (rec__patience__state__numstacks
                           (us_split_fields1 a))) (to_rep
                                                  (rec__patience__state__numstacks
                                                  (us_split_fields1 b))))
                        (= (bool_eq1
                           (rec__patience__state__stacksizes
                           (us_split_fields1 a)) 0 99
                           (rec__patience__state__stacksizes
                           (us_split_fields1 b)) 0 99) true))
                        (= (bool_eq2
                           (rec__patience__state__stacks
                           (us_split_fields1 a)) 0 99
                           (rec__patience__state__stacks
                           (us_split_fields1 b)) 0 99) true))
                        (and
                        (and
                        (= (bool_eq1
                           (rec__patience__state__posstack
                           (us_split_fields1 a)) 0 99
                           (rec__patience__state__posstack
                           (us_split_fields1 b)) 0 99) true)
                        (= (bool_eq1
                           (rec__patience__state__posheight
                           (us_split_fields1 a)) 0 99
                           (rec__patience__state__posheight
                           (us_split_fields1 b)) 0 99) true))
                        (= (bool_eq1
                           (rec__patience__state__preds (us_split_fields1 a))
                           0 99
                           (rec__patience__state__preds (us_split_fields1 b))
                           0 99) true))))
                   true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const patience__state__numelts__first__bit Int)

(declare-const patience__state__numelts__last__bit Int)

(declare-const patience__state__numelts__position Int)

;; patience__state__numelts__first__bit_axiom
  (assert (<= 0 patience__state__numelts__first__bit))

;; patience__state__numelts__last__bit_axiom
  (assert
  (< patience__state__numelts__first__bit patience__state__numelts__last__bit))

;; patience__state__numelts__position_axiom
  (assert (<= 0 patience__state__numelts__position))

(declare-const patience__state__values__first__bit Int)

(declare-const patience__state__values__last__bit Int)

(declare-const patience__state__values__position Int)

;; patience__state__values__first__bit_axiom
  (assert (<= 0 patience__state__values__first__bit))

;; patience__state__values__last__bit_axiom
  (assert
  (< patience__state__values__first__bit patience__state__values__last__bit))

;; patience__state__values__position_axiom
  (assert (<= 0 patience__state__values__position))

(declare-const patience__state__numstacks__first__bit Int)

(declare-const patience__state__numstacks__last__bit Int)

(declare-const patience__state__numstacks__position Int)

;; patience__state__numstacks__first__bit_axiom
  (assert (<= 0 patience__state__numstacks__first__bit))

;; patience__state__numstacks__last__bit_axiom
  (assert
  (< patience__state__numstacks__first__bit patience__state__numstacks__last__bit))

;; patience__state__numstacks__position_axiom
  (assert (<= 0 patience__state__numstacks__position))

(declare-const patience__state__stacksizes__first__bit Int)

(declare-const patience__state__stacksizes__last__bit Int)

(declare-const patience__state__stacksizes__position Int)

;; patience__state__stacksizes__first__bit_axiom
  (assert (<= 0 patience__state__stacksizes__first__bit))

;; patience__state__stacksizes__last__bit_axiom
  (assert
  (< patience__state__stacksizes__first__bit patience__state__stacksizes__last__bit))

;; patience__state__stacksizes__position_axiom
  (assert (<= 0 patience__state__stacksizes__position))

(declare-const patience__state__stacks__first__bit Int)

(declare-const patience__state__stacks__last__bit Int)

(declare-const patience__state__stacks__position Int)

;; patience__state__stacks__first__bit_axiom
  (assert (<= 0 patience__state__stacks__first__bit))

;; patience__state__stacks__last__bit_axiom
  (assert
  (< patience__state__stacks__first__bit patience__state__stacks__last__bit))

;; patience__state__stacks__position_axiom
  (assert (<= 0 patience__state__stacks__position))

(declare-const patience__state__posstack__first__bit Int)

(declare-const patience__state__posstack__last__bit Int)

(declare-const patience__state__posstack__position Int)

;; patience__state__posstack__first__bit_axiom
  (assert (<= 0 patience__state__posstack__first__bit))

;; patience__state__posstack__last__bit_axiom
  (assert
  (< patience__state__posstack__first__bit patience__state__posstack__last__bit))

;; patience__state__posstack__position_axiom
  (assert (<= 0 patience__state__posstack__position))

(declare-const patience__state__posheight__first__bit Int)

(declare-const patience__state__posheight__last__bit Int)

(declare-const patience__state__posheight__position Int)

;; patience__state__posheight__first__bit_axiom
  (assert (<= 0 patience__state__posheight__first__bit))

;; patience__state__posheight__last__bit_axiom
  (assert
  (< patience__state__posheight__first__bit patience__state__posheight__last__bit))

;; patience__state__posheight__position_axiom
  (assert (<= 0 patience__state__posheight__position))

(declare-const patience__state__preds__first__bit Int)

(declare-const patience__state__preds__last__bit Int)

(declare-const patience__state__preds__position Int)

;; patience__state__preds__first__bit_axiom
  (assert (<= 0 patience__state__preds__first__bit))

;; patience__state__preds__last__bit_axiom
  (assert
  (< patience__state__preds__first__bit patience__state__preds__last__bit))

;; patience__state__preds__position_axiom
  (assert (<= 0 patience__state__preds__position))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((state__ref 0))
(((state__refqtmk (state__content us_rep)))))
(define-fun state__ref_state__content__projection ((a state__ref)) us_rep 
  (state__content a))

(declare-const s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tcardarrayD1 0)

(declare-fun tcardarrayD1qtint (tcardarrayD1) Int)

;; tcardarrayD1'axiom
  (assert
  (forall ((i tcardarrayD1))
  (and (<= 0 (tcardarrayD1qtint i)) (<= (tcardarrayD1qtint i) 99))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 99)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (tcardarrayD1 tcardarrayD1) Bool)

(declare-const dummy7 tcardarrayD1)

(declare-datatypes ((tcardarrayD1__ref 0))
(((tcardarrayD1__refqtmk (tcardarrayD1__content tcardarrayD1)))))
(define-fun tcardarrayD1__ref_tcardarrayD1__content__projection ((a tcardarrayD1__ref)) tcardarrayD1 
  (tcardarrayD1__content a))

(declare-sort tindexarrayD1 0)

(declare-fun tindexarrayD1qtint (tindexarrayD1) Int)

;; tindexarrayD1'axiom
  (assert
  (forall ((i tindexarrayD1))
  (and (<= 0 (tindexarrayD1qtint i)) (<= (tindexarrayD1qtint i) 99))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 99)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq8 (tindexarrayD1 tindexarrayD1) Bool)

(declare-const dummy8 tindexarrayD1)

(declare-datatypes ((tindexarrayD1__ref 0))
(((tindexarrayD1__refqtmk (tindexarrayD1__content tindexarrayD1)))))
(define-fun tindexarrayD1__ref_tindexarrayD1__content__projection ((a tindexarrayD1__ref)) tindexarrayD1 
  (tindexarrayD1__content a))

(declare-sort tindexmatrixD1 0)

(declare-fun tindexmatrixD1qtint (tindexmatrixD1) Int)

;; tindexmatrixD1'axiom
  (assert
  (forall ((i tindexmatrixD1))
  (and (<= 0 (tindexmatrixD1qtint i)) (<= (tindexmatrixD1qtint i) 99))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 99)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (tindexmatrixD1 tindexmatrixD1) Bool)

(declare-const dummy9 tindexmatrixD1)

(declare-datatypes ((tindexmatrixD1__ref 0))
(((tindexmatrixD1__refqtmk (tindexmatrixD1__content tindexmatrixD1)))))
(define-fun tindexmatrixD1__ref_tindexmatrixD1__content__projection ((a tindexmatrixD1__ref)) tindexmatrixD1 
  (tindexmatrixD1__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_191 Int)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (or (= temp___is_init_187 true)
                                     (<= 1 52)) (in_range3 temp___expr_191)))

(define-fun dynamic_invariant2 ((temp___expr_204 Int)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (=>
                                     (or (= temp___is_init_200 true)
                                     (<= (- 1) 100)) (in_range2
                                     temp___expr_204)))

(assert
;; defqtvc
 ;; File "patience.ads", line 53, characters 0-0
  (not
  (forall ((o Bool) (usf Int) (o1 Int) (usf1 Int) (o2 Int) (temp___477 Int))
  (=>
  (exists ((o3 Bool))
  (and
  (exists ((o4 Bool))
  (and
  (exists ((o5 Bool))
  (and
  (exists ((o6 Bool))
  (and
  (exists ((o7 Int))
  (and (= (to_rep (rec__patience__state__numstacks (us_split_fields1 s))) o7)
  (ite (<= 0 o7)
  (exists ((o8 Int))
  (and (= (to_rep (rec__patience__state__numelts (us_split_fields1 s))) o8)
  (exists ((o9 Int))
  (and (= (to_rep (rec__patience__state__numstacks (us_split_fields1 s))) o9)
  (= o6 (ite (<= o9 o8) true false)))))) (= o6 false))))
  (ite (= o6 true)
  (exists ((o7 Int))
  (and (= (to_rep (rec__patience__state__numelts (us_split_fields1 s))) o7)
  (= o5 (ite (<= o7 100) true false)))) (= o5 false))))
  (ite (= o5 true)
  (exists ((o6 Int))
  (and (= (to_rep (rec__patience__state__numelts (us_split_fields1 s))) o6)
  (ite (= o6 0) (= o4 true)
  (exists ((o7 Int))
  (and (= (to_rep (rec__patience__state__numstacks (us_split_fields1 s))) o7)
  (= o4 (ite (< 0 o7) true false))))))) (= o4 false))))
  (ite (= o4 true)
  (and
  (exists ((o5 Int))
  (= (to_rep (rec__patience__state__numstacks (us_split_fields1 s))) o5))
  (= o3 (ite (forall ((i Int))
             (=>
             (and (<= 0 i)
             (<= i (- (to_rep
                      (rec__patience__state__numstacks (us_split_fields1 s))) 1)))
             (and
             (and
             (<= 1 (to_rep
                   (select (rec__patience__state__stacksizes
                           (us_split_fields1 s)) i)))
             (<= (to_rep
                 (select (rec__patience__state__stacksizes
                         (us_split_fields1 s)) i)) (to_rep
                                                   (rec__patience__state__numelts
                                                   (us_split_fields1 s)))))
             (forall ((j Int))
             (=>
             (and (<= 0 j)
             (<= j (- (to_rep
                      (select (rec__patience__state__stacksizes
                              (us_split_fields1 s)) i)) 1)))
             (and
             (<= 0 (to_rep
                   (select (select (rec__patience__state__stacks
                                   (us_split_fields1 s)) i) j)))
             (< (to_rep
                (select (select (rec__patience__state__stacks
                                (us_split_fields1 s)) i) j)) (to_rep
                                                             (rec__patience__state__numelts
                                                             (us_split_fields1
                                                             s))))))))))
        true false)))
  (= o3 false))))
  (ite (= o3 true)
  (and
  (exists ((o4 Int))
  (= (to_rep (rec__patience__state__numelts (us_split_fields1 s))) o4))
  (= o (ite (forall ((i Int))
            (=>
            (and (<= 0 i)
            (<= i (- (to_rep
                     (rec__patience__state__numelts (us_split_fields1 s))) 1)))
            (and
            (and
            (let ((temp___460 (to_rep
                              (select (rec__patience__state__posstack
                                      (us_split_fields1 s)) i))))
            (and (<= 0 temp___460)
            (<= temp___460 (- (to_rep
                              (rec__patience__state__numstacks
                              (us_split_fields1 s))) 1))))
            (let ((temp___462 (to_rep
                              (select (rec__patience__state__posheight
                                      (us_split_fields1 s)) i))))
            (and (<= 0 temp___462)
            (<= temp___462 (- (to_rep
                              (select (rec__patience__state__stacksizes
                                      (us_split_fields1 s)) (to_rep
                                                            (select (rec__patience__state__posstack
                                                                    (us_split_fields1
                                                                    s)) i)))) 1)))))
            (= (to_rep
               (select (select (rec__patience__state__stacks
                               (us_split_fields1 s)) (to_rep
                                                     (select (rec__patience__state__posstack
                                                             (us_split_fields1
                                                             s)) i))) 
               (to_rep
               (select (rec__patience__state__posheight (us_split_fields1 s)) i)))) i))))
       true false)))
  (= o false))))
  (=> (= o true)
  (=> (= (to_rep (rec__patience__state__numstacks (us_split_fields1 s))) o1)
  (=>
  (= (and (ite (<= 0 usf) true false) (ite (<= usf (- o1 1)) true false)) true)
  (=> (<= 0 usf)
  (=> (<= usf 99)
  (=>
  (= (to_rep
     (select (rec__patience__state__stacksizes (us_split_fields1 s)) usf)) o2)
  (=>
  (= (and (ite (<= 0 usf1) true false) (ite (<= usf1 (- o2 1)) true false)) true)
  (=> (<= 0 usf)
  (=> (<= usf 99)
  (=> (<= 0 usf1)
  (=> (<= usf1 99)
  (=>
  (= (to_rep
     (select (select (rec__patience__state__stacks (us_split_fields1 s)) usf) usf1)) temp___477)
  (<= 0 temp___477)))))))))))))))))
(check-sat)
(exit)
