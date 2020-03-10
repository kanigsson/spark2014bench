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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort item_t 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 9)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (item_t item_t) Bool)

(declare-const dummy1 item_t)

(declare-datatypes ((item_t__ref 0))
(((item_t__refqtmk (item_t__content item_t)))))
(define-fun item_t__ref_item_t__content__4__projection ((a item_t__ref)) item_t 
  (item_t__content a))

(declare-fun to_rep1 (item_t) Int)

(declare-fun of_rep1 (Int) item_t)

;; inversion_axiom
  (assert
  (forall ((x item_t))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x item_t)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int item_t))))))
(declare-fun slide ((Array Int item_t) Int Int) (Array Int item_t))

;; slide_eq
  (assert
  (forall ((a (Array Int item_t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int item_t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int item_t)) (a__first Int) (a__last Int)
  (b (Array Int item_t)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep1 (select a temp___idx_155)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int item_t)) (b (Array Int item_t)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep1 (select a temp___idx_155)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const dummy2 (Array Int item_t))

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

(declare-fun user_eq2 ((Array Int item_t) (Array Int item_t)) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__test__fruit_rec__record_t__d natural)))))
(define-fun us_split_discrs_rec__test__fruit_rec__record_t__d__projection ((a us_split_discrs)) natural 
  (rec__test__fruit_rec__record_t__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__test__fruit_rec__record_t__single_item item_t)(rec__test__fruit_rec__record_t__a item_t)(rec__test__fruit_rec__record_t__b item_t)(rec__test__fruit_rec__record_t__arr (Array Int item_t))))))
(define-fun us_split_fields_rec__test__fruit_rec__record_t__single_item__projection ((a us_split_fields)) item_t 
  (rec__test__fruit_rec__record_t__single_item a))

(define-fun us_split_fields_rec__test__fruit_rec__record_t__a__projection ((a us_split_fields)) item_t 
  (rec__test__fruit_rec__record_t__a a))

(define-fun us_split_fields_rec__test__fruit_rec__record_t__b__projection ((a us_split_fields)) item_t 
  (rec__test__fruit_rec__record_t__b a))

(define-fun us_split_fields_rec__test__fruit_rec__record_t__arr__projection ((a us_split_fields)) (Array Int item_t) 
  (rec__test__fruit_rec__record_t__arr a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun test__fruit_rec__record_t__single_item__pred ((a us_rep)) Bool (= 
  (to_rep (rec__test__fruit_rec__record_t__d (us_split_discrs1 a))) 1))

(define-fun test__fruit_rec__record_t__a__pred ((a us_rep)) Bool (= (to_rep
                                                                    (rec__test__fruit_rec__record_t__d
                                                                    (us_split_discrs1
                                                                    a))) 2))

(define-fun test__fruit_rec__record_t__b__pred ((a us_rep)) Bool (= (to_rep
                                                                    (rec__test__fruit_rec__record_t__d
                                                                    (us_split_discrs1
                                                                    a))) 2))

(define-fun test__fruit_rec__record_t__arr__pred ((a us_rep)) Bool (and
                                                                   (not
                                                                   (= 
                                                                   (to_rep
                                                                   (rec__test__fruit_rec__record_t__d
                                                                   (us_split_discrs1
                                                                   a))) 1))
                                                                   (not
                                                                   (= 
                                                                   (to_rep
                                                                   (rec__test__fruit_rec__record_t__d
                                                                   (us_split_discrs1
                                                                   a))) 2))))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__test__fruit_rec__record_t__d
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__test__fruit_rec__record_t__d
                                                  (us_split_discrs1 b))))
                        (and
                        (and
                        (=> (test__fruit_rec__record_t__single_item__pred a)
                        (= (to_rep1
                           (rec__test__fruit_rec__record_t__single_item
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__test__fruit_rec__record_t__single_item
                                                  (us_split_fields1 b)))))
                        (=> (test__fruit_rec__record_t__a__pred a)
                        (= (to_rep1
                           (rec__test__fruit_rec__record_t__a
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__test__fruit_rec__record_t__a
                                                  (us_split_fields1 b))))))
                        (and
                        (=> (test__fruit_rec__record_t__b__pred a)
                        (= (to_rep1
                           (rec__test__fruit_rec__record_t__b
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__test__fruit_rec__record_t__b
                                                  (us_split_fields1 b)))))
                        (=> (test__fruit_rec__record_t__arr__pred a)
                        (= (bool_eq
                           (rec__test__fruit_rec__record_t__arr
                           (us_split_fields1 a)) 1 5
                           (rec__test__fruit_rec__record_t__arr
                           (us_split_fields1 b)) 1 5) true)))))
                   true false))

(define-fun in_range2 ((rec__test__fruit_rec__record_t__d1 Int)
  (a us_split_discrs)) Bool (= rec__test__fruit_rec__record_t__d1 (to_rep
                                                                  (rec__test__fruit_rec__record_t__d
                                                                  a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test__fruit_rec__record_t__d__first__bit Int)

(declare-const test__fruit_rec__record_t__d__last__bit Int)

(declare-const test__fruit_rec__record_t__d__position Int)

;; test__fruit_rec__record_t__d__first__bit_axiom
  (assert (<= 0 test__fruit_rec__record_t__d__first__bit))

;; test__fruit_rec__record_t__d__last__bit_axiom
  (assert
  (< test__fruit_rec__record_t__d__first__bit test__fruit_rec__record_t__d__last__bit))

;; test__fruit_rec__record_t__d__position_axiom
  (assert (<= 0 test__fruit_rec__record_t__d__position))

(declare-const test__fruit_rec__record_t__single_item__first__bit Int)

(declare-const test__fruit_rec__record_t__single_item__last__bit Int)

(declare-const test__fruit_rec__record_t__single_item__position Int)

;; test__fruit_rec__record_t__single_item__first__bit_axiom
  (assert (<= 0 test__fruit_rec__record_t__single_item__first__bit))

;; test__fruit_rec__record_t__single_item__last__bit_axiom
  (assert
  (< test__fruit_rec__record_t__single_item__first__bit test__fruit_rec__record_t__single_item__last__bit))

;; test__fruit_rec__record_t__single_item__position_axiom
  (assert (<= 0 test__fruit_rec__record_t__single_item__position))

(declare-const test__fruit_rec__record_t__a__first__bit Int)

(declare-const test__fruit_rec__record_t__a__last__bit Int)

(declare-const test__fruit_rec__record_t__a__position Int)

;; test__fruit_rec__record_t__a__first__bit_axiom
  (assert (<= 0 test__fruit_rec__record_t__a__first__bit))

;; test__fruit_rec__record_t__a__last__bit_axiom
  (assert
  (< test__fruit_rec__record_t__a__first__bit test__fruit_rec__record_t__a__last__bit))

;; test__fruit_rec__record_t__a__position_axiom
  (assert (<= 0 test__fruit_rec__record_t__a__position))

(declare-const test__fruit_rec__record_t__b__first__bit Int)

(declare-const test__fruit_rec__record_t__b__last__bit Int)

(declare-const test__fruit_rec__record_t__b__position Int)

;; test__fruit_rec__record_t__b__first__bit_axiom
  (assert (<= 0 test__fruit_rec__record_t__b__first__bit))

;; test__fruit_rec__record_t__b__last__bit_axiom
  (assert
  (< test__fruit_rec__record_t__b__first__bit test__fruit_rec__record_t__b__last__bit))

;; test__fruit_rec__record_t__b__position_axiom
  (assert (<= 0 test__fruit_rec__record_t__b__position))

(declare-const test__fruit_rec__record_t__arr__first__bit Int)

(declare-const test__fruit_rec__record_t__arr__last__bit Int)

(declare-const test__fruit_rec__record_t__arr__position Int)

;; test__fruit_rec__record_t__arr__first__bit_axiom
  (assert (<= 0 test__fruit_rec__record_t__arr__first__bit))

;; test__fruit_rec__record_t__arr__last__bit_axiom
  (assert
  (< test__fruit_rec__record_t__arr__first__bit test__fruit_rec__record_t__arr__last__bit))

;; test__fruit_rec__record_t__arr__position_axiom
  (assert (<= 0 test__fruit_rec__record_t__arr__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((record_t__ref 0))
(((record_t__refqtmk (record_t__content us_rep)))))
(define-fun record_t__ref_record_t__content__projection ((a record_t__ref)) us_rep 
  (record_t__content a))

(declare-const rec1 us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const rec2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_293 us_rep)
  (temp___skip_top_level_294 Bool)) Bool (= (to_rep
                                            (rec__test__fruit_rec__record_t__d
                                            (us_split_discrs1
                                            temp___expr_293))) 0))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun dynamic_invariant1 ((temp___expr_273 Int)
  (temp___is_init_269 Bool) (temp___skip_constant_270 Bool)
  (temp___do_toplevel_271 Bool)
  (temp___do_typ_inv_272 Bool)) Bool (=>
                                     (or (= temp___is_init_269 true)
                                     (<= 0 9)) (in_range1 temp___expr_273)))

(assert
;; defqtvc
 ;; File "test.ads", line 47, characters 0-0
  (not
  (forall ((rec2__split_fields us_split_fields) (rec2__split_discrs natural)
  (o Int) (spark__branch Bool))
  (=>
  (= (to_rep (rec__test__fruit_rec__record_t__d (us_split_discrs1 rec1))) 
  (to_rep rec2__split_discrs))
  (=>
  (= (to_rep (rec__test__fruit_rec__record_t__d (us_split_discrs1 rec1))) o)
  (=> (= spark__branch (ite (= o 1) true false))
  (=> (= spark__branch true) (test__fruit_rec__record_t__single_item__pred
  (us_repqtmk (us_split_discrsqtmk rec2__split_discrs) rec2__split_fields)))))))))
(check-sat)
(exit)
