(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Bool)

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-const last Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ()
((my_nat__ref (my_nat__refqtmk (my_nat__content integer)))))
(define-fun my_nat__ref_my_nat__content__projection ((a my_nat__ref)) integer 
  (my_nat__content a))

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__dynamic_array__rec__b Bool)))))
(define-fun us_split_discrs_rec__dynamic_array__rec__b__projection ((a us_split_discrs)) Bool 
  (rec__dynamic_array__rec__b a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__dynamic_array__rec__f1 integer)(rec__dynamic_array__rec__f2 integer)))))
(define-fun us_split_fields_rec__dynamic_array__rec__f1__projection ((a us_split_fields)) integer 
  (rec__dynamic_array__rec__f1 a))

(define-fun us_split_fields_rec__dynamic_array__rec__f2__projection ((a us_split_fields)) integer 
  (rec__dynamic_array__rec__f2 a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun dynamic_array__rec__f1__pred ((a us_rep)) Bool (= (ite (rec__dynamic_array__rec__b
                                                                   (us_split_discrs1
                                                                   a)) 1 0) 1))

(define-fun dynamic_array__rec__f2__pred ((a us_rep)) Bool (= (ite (rec__dynamic_array__rec__b
                                                                   (us_split_discrs1
                                                                   a)) 1 0) 0))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__dynamic_array__rec__b
                                (us_split_discrs1 a)) 1 0) (ite (rec__dynamic_array__rec__b
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (and
                        (=> (dynamic_array__rec__f1__pred a)
                        (= (to_rep
                           (rec__dynamic_array__rec__f1 (us_split_fields1 a))) 
                        (to_rep
                        (rec__dynamic_array__rec__f1 (us_split_fields1 b)))))
                        (=> (dynamic_array__rec__f2__pred a)
                        (= (to_rep
                           (rec__dynamic_array__rec__f2 (us_split_fields1 a))) 
                        (to_rep
                        (rec__dynamic_array__rec__f2 (us_split_fields1 b)))))))
                   true false))

(define-fun in_range3 ((rec__dynamic_array__rec__b1 Bool)
  (a us_split_discrs)) Bool (= rec__dynamic_array__rec__b1 (rec__dynamic_array__rec__b
                                                           a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const dynamic_array__rec__b__first__bit Int)

(declare-const dynamic_array__rec__b__last__bit Int)

(declare-const dynamic_array__rec__b__position Int)

;; dynamic_array__rec__b__first__bit_axiom
  (assert (<= 0 dynamic_array__rec__b__first__bit))

;; dynamic_array__rec__b__last__bit_axiom
  (assert
  (< dynamic_array__rec__b__first__bit dynamic_array__rec__b__last__bit))

;; dynamic_array__rec__b__position_axiom
  (assert (<= 0 dynamic_array__rec__b__position))

(declare-const dynamic_array__rec__f1__first__bit Int)

(declare-const dynamic_array__rec__f1__last__bit Int)

(declare-const dynamic_array__rec__f1__position Int)

;; dynamic_array__rec__f1__first__bit_axiom
  (assert (<= 0 dynamic_array__rec__f1__first__bit))

;; dynamic_array__rec__f1__last__bit_axiom
  (assert
  (< dynamic_array__rec__f1__first__bit dynamic_array__rec__f1__last__bit))

;; dynamic_array__rec__f1__position_axiom
  (assert (<= 0 dynamic_array__rec__f1__position))

(declare-const dynamic_array__rec__f2__first__bit Int)

(declare-const dynamic_array__rec__f2__last__bit Int)

(declare-const dynamic_array__rec__f2__position Int)

;; dynamic_array__rec__f2__first__bit_axiom
  (assert (<= 0 dynamic_array__rec__f2__first__bit))

;; dynamic_array__rec__f2__last__bit_axiom
  (assert
  (< dynamic_array__rec__f2__first__bit dynamic_array__rec__f2__last__bit))

;; dynamic_array__rec__f2__position_axiom
  (assert (<= 0 dynamic_array__rec__f2__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((rec____ref (rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(declare-const r us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_177 us_rep)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (and
                                     (=> (dynamic_array__rec__f1__pred
                                     temp___expr_177)
                                     (=>
                                     (or (= temp___is_init_173 true)
                                     (<= 0 last)) (dynamic_property 0 
                                     last
                                     (to_rep
                                     (rec__dynamic_array__rec__f1
                                     (us_split_fields1 temp___expr_177))))))
                                     (=> (dynamic_array__rec__f2__pred
                                     temp___expr_177)
                                     (=>
                                     (or (= temp___is_init_173 true)
                                     (<= 0 last)) (dynamic_property 0 
                                     last
                                     (to_rep
                                     (rec__dynamic_array__rec__f2
                                     (us_split_fields1 temp___expr_177))))))))

(define-fun default_initial_assumption ((temp___expr_179 us_rep)
  (temp___skip_top_level_180 Bool)) Bool (= (rec__dynamic_array__rec__b
                                            (us_split_discrs1
                                            temp___expr_179)) (distinct 1 0)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_170 Int)
  (temp___is_init_166 Bool) (temp___skip_constant_167 Bool)
  (temp___do_toplevel_168 Bool)
  (temp___do_typ_inv_169 Bool)) Bool (=>
                                     (or (= temp___is_init_166 true)
                                     (<= 0 last)) (dynamic_property 0 
                                     last temp___expr_170)))

;; last__def_axiom
  (assert (= last c))

;; Assume
  (assert (dynamic_invariant c true false true true))

;; Assume
  (assert (dynamic_invariant c true false true true))

;; Assume
  (assert (dynamic_invariant1 r true false true true))

;; H
  (assert (not (= (rec__dynamic_array__rec__b (us_split_discrs1 r)) true)))

(define-fun o () us_rep r)

;; H
  (assert (< (to_rep (rec__dynamic_array__rec__f2 (us_split_fields1 o))) 
  c))

(define-fun o1 () us_rep r)

(assert
;; defqtvc
 ;; File "dynamic_array.adb", line 31, characters 0-0
  (not (dynamic_array__rec__f2__pred o1)))
(check-sat)

(exit)
