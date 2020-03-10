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

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__p__t__access_count natural)(rec__p__t__locked Bool)))))
(define-fun us_split_fields_rec__p__t__access_count__projection ((a us_split_fields)) natural 
  (rec__p__t__access_count a))

(define-fun us_split_fields_rec__p__t__locked__projection ((a us_split_fields)) Bool 
  (rec__p__t__locked a))

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
                        (= (to_rep
                           (rec__p__t__access_count (us_split_fields1 a))) 
                        (to_rep
                        (rec__p__t__access_count (us_split_fields1 b))))
                        (= (ite (rec__p__t__locked (us_split_fields1 a)) 1 0) (ite 
                        (rec__p__t__locked (us_split_fields1 b)) 1 0)))
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

(declare-const p__t__access_count__first__bit Int)

(declare-const p__t__access_count__last__bit Int)

(declare-const p__t__access_count__position Int)

;; p__t__access_count__first__bit_axiom
  (assert (<= 0 p__t__access_count__first__bit))

;; p__t__access_count__last__bit_axiom
  (assert (< p__t__access_count__first__bit p__t__access_count__last__bit))

;; p__t__access_count__position_axiom
  (assert (<= 0 p__t__access_count__position))

(declare-const p__t__locked__first__bit Int)

(declare-const p__t__locked__last__bit Int)

(declare-const p__t__locked__position Int)

;; p__t__locked__first__bit_axiom
  (assert (<= 0 p__t__locked__first__bit))

;; p__t__locked__last__bit_axiom
  (assert (< p__t__locked__first__bit p__t__locked__last__bit))

;; p__t__locked__position_axiom
  (assert (<= 0 p__t__locked__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_159 us_rep)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=> (= temp___do_toplevel_157 true)
                                     (=
                                     (= (rec__p__t__locked
                                        (us_split_fields1 temp___expr_159)) true)
                                     (< 3 (to_rep
                                          (rec__p__t__access_count
                                          (us_split_fields1 temp___expr_159)))))))

(define-fun default_initial_assumption ((temp___expr_161 us_rep)
  (temp___skip_top_level_162 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__p__t__access_count
                                            (us_split_fields1
                                            temp___expr_161))) 0)
                                         (= (rec__p__t__locked
                                            (us_split_fields1
                                            temp___expr_161)) (distinct 0 0))))

(define-fun dynamic_predicate ((temp___163 us_rep)) Bool (=
                                                         (= (rec__p__t__locked
                                                            (us_split_fields1
                                                            temp___163)) true)
                                                         (< 3 (to_rep
                                                              (rec__p__t__access_count
                                                              (us_split_fields1
                                                              temp___163))))))

(declare-const i1s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "p.ads", line 3, characters 0-0
  (not
  (forall ((v__split_fields us_split_fields) (o Int))
  (=> (dynamic_invariant i1s true false true true)
  (=> (dynamic_invariant i1s true false true true)
  (=> (dynamic_invariant (us_repqtmk v__split_fields) true false true true)
  (=> (= (to_rep (rec__p__t__access_count v__split_fields)) o)
  (let ((o1 (+ o 1)))
  (=> (in_range1 o1)
  (forall ((o2 natural))
  (=> (= (to_rep o2) o1)
  (=> (dynamic_predicate
  (us_repqtmk (us_split_fieldsqtmk o2 (rec__p__t__locked v__split_fields))))
  (forall ((v__split_fields1 us_split_fields))
  (=>
  (= v__split_fields1 (us_split_fieldsqtmk o2
                      (rec__p__t__locked v__split_fields)))
  (dynamic_predicate
  (us_repqtmk
  (us_split_fieldsqtmk (rec__p__t__access_count v__split_fields1)
  (distinct 1 0))))))))))))))))))
(check-sat)
(exit)
