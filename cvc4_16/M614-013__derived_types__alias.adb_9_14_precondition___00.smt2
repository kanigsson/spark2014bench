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

(declare-sort element 0)

(declare-fun elementqtint (element) Int)

;; element'axiom
  (assert
  (forall ((i element))
  (and (<= 0 (elementqtint i)) (<= (elementqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (element element) Bool)

(declare-const dummy1 element)

(declare-datatypes ((element__ref 0))
(((element__refqtmk (element__content element)))))
(define-fun element__ref_element__content__projection ((a element__ref)) element 
  (element__content a))

(define-fun to_rep1 ((x element)) Int (elementqtint x))

(declare-fun of_rep1 (Int) element)

;; inversion_axiom
  (assert
  (forall ((x element))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x element)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__alias__my_rec__content element)(rec__alias__my_rec__modulus natural)))))
(define-fun us_split_fields_rec__alias__my_rec__content__projection ((a us_split_fields)) element 
  (rec__alias__my_rec__content a))

(define-fun us_split_fields_rec__alias__my_rec__modulus__projection ((a us_split_fields)) natural 
  (rec__alias__my_rec__modulus a))

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
                        (= (to_rep1
                           (rec__alias__my_rec__content (us_split_fields1 a))) 
                        (to_rep1
                        (rec__alias__my_rec__content (us_split_fields1 b))))
                        (= (to_rep
                           (rec__alias__my_rec__modulus (us_split_fields1 a))) 
                        (to_rep
                        (rec__alias__my_rec__modulus (us_split_fields1 b)))))
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

(declare-const alias__my_rec__content__first__bit Int)

(declare-const alias__my_rec__content__last__bit Int)

(declare-const alias__my_rec__content__position Int)

;; alias__my_rec__content__first__bit_axiom
  (assert (<= 0 alias__my_rec__content__first__bit))

;; alias__my_rec__content__last__bit_axiom
  (assert
  (< alias__my_rec__content__first__bit alias__my_rec__content__last__bit))

;; alias__my_rec__content__position_axiom
  (assert (<= 0 alias__my_rec__content__position))

(declare-const alias__my_rec__modulus__first__bit Int)

(declare-const alias__my_rec__modulus__last__bit Int)

(declare-const alias__my_rec__modulus__position Int)

;; alias__my_rec__modulus__first__bit_axiom
  (assert (<= 0 alias__my_rec__modulus__first__bit))

;; alias__my_rec__modulus__last__bit_axiom
  (assert
  (< alias__my_rec__modulus__first__bit alias__my_rec__modulus__last__bit))

;; alias__my_rec__modulus__position_axiom
  (assert (<= 0 alias__my_rec__modulus__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((my_rec__ref 0))
(((my_rec__refqtmk (my_rec__content us_rep)))))
(define-fun my_rec__ref_my_rec__content__projection ((a my_rec__ref)) us_rep 
  (my_rec__content a))

(declare-fun get_content (us_rep) Int)

(declare-fun get_content__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 0 100)) (in_range1 temp___expr_160)))

(define-fun default_initial_assumption ((temp___expr_168 us_rep)
  (temp___skip_top_level_169 Bool)) Bool (and
                                         (= (to_rep1
                                            (rec__alias__my_rec__content
                                            (us_split_fields1
                                            temp___expr_168))) 0)
                                         (= (to_rep
                                            (rec__alias__my_rec__modulus
                                            (us_split_fields1
                                            temp___expr_168))) 0)))

;; get_content__post_axiom
  (assert
  (forall ((r us_rep))
  (! (=> (< 0 (to_rep (rec__alias__my_rec__modulus (us_split_fields1 r))))
     (let ((result (get_content r)))
     (=> (get_content__function_guard result r) (dynamic_invariant result
     true false true true)))) :pattern ((get_content r)) )))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const alias__my_rec__content__first__bit1 Int)

(declare-const alias__my_rec__content__last__bit1 Int)

(declare-const alias__my_rec__content__position1 Int)

;; alias__my_rec__content__first__bit_axiom
  (assert (<= 0 alias__my_rec__content__first__bit1))

;; alias__my_rec__content__last__bit_axiom
  (assert
  (< alias__my_rec__content__first__bit1 alias__my_rec__content__last__bit1))

;; alias__my_rec__content__position_axiom
  (assert (<= 0 alias__my_rec__content__position1))

(declare-const alias__my_rec__modulus__first__bit1 Int)

(declare-const alias__my_rec__modulus__last__bit1 Int)

(declare-const alias__my_rec__modulus__position1 Int)

;; alias__my_rec__modulus__first__bit_axiom
  (assert (<= 0 alias__my_rec__modulus__first__bit1))

;; alias__my_rec__modulus__last__bit_axiom
  (assert
  (< alias__my_rec__modulus__first__bit1 alias__my_rec__modulus__last__bit1))

;; alias__my_rec__modulus__position_axiom
  (assert (<= 0 alias__my_rec__modulus__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((my_alias__ref 0))
(((my_alias__refqtmk (my_alias__content us_rep)))))
(define-fun my_alias__ref_my_alias__content__projection ((a my_alias__ref)) us_rep 
  (my_alias__content a))

(declare-const r us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption1 ((temp___expr_175 us_rep)
  (temp___skip_top_level_176 Bool)) Bool (and
                                         (= (to_rep1
                                            (rec__alias__my_rec__content
                                            (us_split_fields1
                                            temp___expr_175))) 0)
                                         (= (to_rep
                                            (rec__alias__my_rec__modulus
                                            (us_split_fields1
                                            temp___expr_175))) 0)))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(assert
;; defqtvc
 ;; File "alias.ads", line 13, characters 0-0
  (not
  (=> (dynamic_invariant x true false true true)
  (< 0 (to_rep (rec__alias__my_rec__modulus (us_split_fields1 r)))))))
(check-sat)
(exit)
