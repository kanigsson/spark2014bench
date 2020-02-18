;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__simple_oo_without_contracts__t__x integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__simple_oo_without_contracts__t__x__projection ((a us_split_fields)) integer 
  (rec__simple_oo_without_contracts__t__x a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__simple_oo_without_contracts__t__x
                           (us_split_fields1 a))) (to_rep
                                                  (rec__simple_oo_without_contracts__t__x
                                                  (us_split_fields1 b))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const simple_oo_without_contracts__t__x__first__bit Int)

(declare-const simple_oo_without_contracts__t__x__last__bit Int)

(declare-const simple_oo_without_contracts__t__x__position Int)

;; simple_oo_without_contracts__t__x__first__bit_axiom
  (assert (<= 0 simple_oo_without_contracts__t__x__first__bit))

;; simple_oo_without_contracts__t__x__last__bit_axiom
  (assert
  (< simple_oo_without_contracts__t__x__first__bit simple_oo_without_contracts__t__x__last__bit))

;; simple_oo_without_contracts__t__x__position_axiom
  (assert (<= 0 simple_oo_without_contracts__t__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__simple_oo_without_contracts__t1__y integer)(rec__simple_oo_without_contracts__t__x1 integer)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__simple_oo_without_contracts__t1__y__projection ((a us_split_fields2)) integer 
  (rec__simple_oo_without_contracts__t1__y a))

(define-fun us_split_fields_rec__simple_oo_without_contracts__t__x__2__projection ((a us_split_fields2)) integer 
  (rec__simple_oo_without_contracts__t__x1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (integer us_private) us_private)

(declare-fun extract__simple_oo_without_contracts__t1__y (us_private) integer)

;; extract__simple_oo_without_contracts__t1__y__conv
  (assert
  (forall ((simple_oo_without_contracts__t1__y integer))
  (forall ((rec__ext__2 us_private))
  (= (extract__simple_oo_without_contracts__t1__y
     (hide_ext__ simple_oo_without_contracts__t1__y rec__ext__2)) simple_oo_without_contracts__t1__y))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__simple_oo_without_contracts__t__x1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__simple_oo_without_contracts__t1__y
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__simple_oo_without_contracts__t1__y
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__simple_oo_without_contracts__t__x
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__simple_oo_without_contracts__t1__y
                            (us_split_fields3 a))) (to_rep
                                                   (rec__simple_oo_without_contracts__t1__y
                                                   (us_split_fields3 b))))
                         (= (to_rep
                            (rec__simple_oo_without_contracts__t__x1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__simple_oo_without_contracts__t__x1
                                                   (us_split_fields3 b)))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const simple_oo_without_contracts__t1__y__first__bit Int)

(declare-const simple_oo_without_contracts__t1__y__last__bit Int)

(declare-const simple_oo_without_contracts__t1__y__position Int)

;; simple_oo_without_contracts__t1__y__first__bit_axiom
  (assert (<= 0 simple_oo_without_contracts__t1__y__first__bit))

;; simple_oo_without_contracts__t1__y__last__bit_axiom
  (assert
  (< simple_oo_without_contracts__t1__y__first__bit simple_oo_without_contracts__t1__y__last__bit))

;; simple_oo_without_contracts__t1__y__position_axiom
  (assert (<= 0 simple_oo_without_contracts__t1__y__position))

(declare-const simple_oo_without_contracts__t__x__first__bit1 Int)

(declare-const simple_oo_without_contracts__t__x__last__bit1 Int)

(declare-const simple_oo_without_contracts__t__x__position1 Int)

;; simple_oo_without_contracts__t__x__first__bit_axiom
  (assert (<= 0 simple_oo_without_contracts__t__x__first__bit1))

;; simple_oo_without_contracts__t__x__last__bit_axiom
  (assert
  (< simple_oo_without_contracts__t__x__first__bit1 simple_oo_without_contracts__t__x__last__bit1))

;; simple_oo_without_contracts__t__x__position_axiom
  (assert (<= 0 simple_oo_without_contracts__t__x__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((t1__ref 0))
(((t1__refqtmk (t1__content us_rep1)))))
(define-fun t1__ref_t1__content__projection ((a t1__ref)) us_rep1 (t1__content
                                                                  a))

(declare-const par1 us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun default_initial_assumption ((temp___expr_168 us_rep1)
  (temp___skip_top_level_169 Bool)) Bool (= (attr__tag1 temp___expr_168) 
  us_tag1))

(define-fun default_initial_assumption1 ((temp___expr_159 us_rep)
  (temp___skip_top_level_160 Bool)) Bool (= (attr__tag temp___expr_159) 
  us_tag))

(assert
;; defqtvc
 ;; File "simple_oo_without_contracts.ads", line 15, characters 0-0
  (not
  (forall ((g1 Int) (g2 Int) (g3 Int) (g4 Int) (o Int) (o1 Int))
  (=> (dynamic_invariant g1 true false true true)
  (=> (= g1 g2)
  (=> (dynamic_invariant g2 true false true true)
  (=> (dynamic_invariant g3 true false true true)
  (=> (dynamic_invariant g4 false false true true)
  (=>
  (= (to_rep
     (rec__simple_oo_without_contracts__t1__y (us_split_fields3 par1))) o)
  (=>
  (= (to_rep
     (rec__simple_oo_without_contracts__t__x1 (us_split_fields3 par1))) o1)
  (let ((o2 (+ g3 o1))) (=> (in_range o2) (in_range (+ o2 o))))))))))))))
(check-sat)