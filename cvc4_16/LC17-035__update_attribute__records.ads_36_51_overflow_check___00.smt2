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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort my_range 0)

(declare-fun my_rangeqtint (my_range) Int)

;; my_range'axiom
  (assert
  (forall ((i my_range))
  (and (<= 1 (my_rangeqtint i)) (<= (my_rangeqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (my_range my_range) Bool)

(declare-const dummy2 my_range)

(declare-datatypes ((my_range__ref 0))
(((my_range__refqtmk (my_range__content my_range)))))
(define-fun my_range__ref_my_range__content__projection ((a my_range__ref)) my_range 
  (my_range__content a))

(define-fun to_rep2 ((x my_range)) Int (my_rangeqtint x))

(declare-fun of_rep2 (Int) my_range)

;; inversion_axiom
  (assert
  (forall ((x my_range))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x my_range)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__types__rec__s1 integer)(rec__types__rec__s2 natural)(rec__types__rec__s3 my_range)(rec__types__rec__s4 integer)))))
(define-fun us_split_fields_rec__types__rec__s1__projection ((a us_split_fields)) integer 
  (rec__types__rec__s1 a))

(define-fun us_split_fields_rec__types__rec__s2__projection ((a us_split_fields)) natural 
  (rec__types__rec__s2 a))

(define-fun us_split_fields_rec__types__rec__s3__projection ((a us_split_fields)) my_range 
  (rec__types__rec__s3 a))

(define-fun us_split_fields_rec__types__rec__s4__projection ((a us_split_fields)) integer 
  (rec__types__rec__s4 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__types__rec__s1 (us_split_fields1 a))) 
                        (to_rep (rec__types__rec__s1 (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__types__rec__s2 (us_split_fields1 a))) 
                        (to_rep1 (rec__types__rec__s2 (us_split_fields1 b)))))
                        (and
                        (= (to_rep2
                           (rec__types__rec__s3 (us_split_fields1 a))) 
                        (to_rep2 (rec__types__rec__s3 (us_split_fields1 b))))
                        (= (to_rep
                           (rec__types__rec__s4 (us_split_fields1 a))) 
                        (to_rep (rec__types__rec__s4 (us_split_fields1 b))))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const types__rec__s1__first__bit Int)

(declare-const types__rec__s1__last__bit Int)

(declare-const types__rec__s1__position Int)

;; types__rec__s1__first__bit_axiom
  (assert (<= 0 types__rec__s1__first__bit))

;; types__rec__s1__last__bit_axiom
  (assert (< types__rec__s1__first__bit types__rec__s1__last__bit))

;; types__rec__s1__position_axiom
  (assert (<= 0 types__rec__s1__position))

(declare-const types__rec__s2__first__bit Int)

(declare-const types__rec__s2__last__bit Int)

(declare-const types__rec__s2__position Int)

;; types__rec__s2__first__bit_axiom
  (assert (<= 0 types__rec__s2__first__bit))

;; types__rec__s2__last__bit_axiom
  (assert (< types__rec__s2__first__bit types__rec__s2__last__bit))

;; types__rec__s2__position_axiom
  (assert (<= 0 types__rec__s2__position))

(declare-const types__rec__s3__first__bit Int)

(declare-const types__rec__s3__last__bit Int)

(declare-const types__rec__s3__position Int)

;; types__rec__s3__first__bit_axiom
  (assert (<= 0 types__rec__s3__first__bit))

;; types__rec__s3__last__bit_axiom
  (assert (< types__rec__s3__first__bit types__rec__s3__last__bit))

;; types__rec__s3__position_axiom
  (assert (<= 0 types__rec__s3__position))

(declare-const types__rec__s4__first__bit Int)

(declare-const types__rec__s4__last__bit Int)

(declare-const types__rec__s4__position Int)

;; types__rec__s4__first__bit_axiom
  (assert (<= 0 types__rec__s4__first__bit))

;; types__rec__s4__last__bit_axiom
  (assert (< types__rec__s4__first__bit types__rec__s4__last__bit))

;; types__rec__s4__position_axiom
  (assert (<= 0 types__rec__s4__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((rec____ref 0))
(((rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 1 10)) (in_range3 temp___expr_158)))

(assert
;; defqtvc
 ;; File "records.ads", line 33, characters 0-0
  (not
  (forall ((r__split_fields us_split_fields) (o Int))
  (=> (< (to_rep (rec__types__rec__s1 r__split_fields)) 2147483647)
  (=> (< 1 (to_rep2 (rec__types__rec__s3 r__split_fields)))
  (=> (= (to_rep (rec__types__rec__s1 r__split_fields)) o)
  (let ((o1 (+ o 1)))
  (=> (in_range1 o1)
  (forall ((o2 integer))
  (=> (= (to_rep o2) o1)
  (forall ((r__split_fields1 us_split_fields))
  (=>
  (= r__split_fields1 (us_split_fieldsqtmk o2
                      (rec__types__rec__s2 r__split_fields)
                      (rec__types__rec__s3 r__split_fields)
                      (rec__types__rec__s4 r__split_fields)))
  (forall ((o3 Int))
  (=> (= (to_rep2 (rec__types__rec__s3 r__split_fields1)) o3)
  (let ((o4 (- o3 1)))
  (=> (in_range3 o4)
  (forall ((o5 my_range))
  (=> (= (to_rep2 o5) o4)
  (forall ((r__split_fields2 us_split_fields))
  (=>
  (= r__split_fields2 (us_split_fieldsqtmk
                      (rec__types__rec__s1 r__split_fields1)
                      (rec__types__rec__s2 r__split_fields1) o5
                      (rec__types__rec__s4 r__split_fields1)))
  (forall ((o6 Int))
  (=> (= (to_rep2 (rec__types__rec__s3 r__split_fields)) o6)
  (let ((o7 (- o6 1)))
  (=> (in_range3 o7)
  (forall ((o8 my_range))
  (=> (= (to_rep2 o8) o7)
  (forall ((o9 Int))
  (=> (= (to_rep (rec__types__rec__s1 r__split_fields)) o9) (in_range1
  (+ o9 1))))))))))))))))))))))))))))))
(check-sat)
(exit)
