;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-sort cell 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (cell cell) Bool)

(declare-const dummy1 cell)

(declare-datatypes () ((cell__ref (cell__refqtmk (cell__content cell)))))
(define-fun cell__ref_cell__content__projection ((a cell__ref)) cell 
  (cell__content a))

(declare-fun to_rep (cell) Int)

(declare-fun of_rep (Int) cell)

;; inversion_axiom
  (assert
  (forall ((x cell)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x cell)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int cell))))))
(declare-fun slide ((Array Int cell) Int Int) (Array Int cell))

;; slide_eq
  (assert
  (forall ((a (Array Int cell)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int cell)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int cell)) (a__first Int) (a__last Int)
  (b (Array Int cell)) (b__first Int)
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
  (forall ((a (Array Int cell)) (b (Array Int cell)))
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

(declare-const dummy2 (Array Int cell))

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

(declare-fun user_eq2 ((Array Int cell) (Array Int cell)) Bool)

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int (Array Int cell)))))))
(declare-fun slide1 ((Array Int (Array Int cell)) Int
  Int) (Array Int (Array Int cell)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int cell))))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int cell))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int (Array Int cell))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int cell))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155) 1 10
                              (select b (+ (- b__first a__first) temp___idx_155))
                              1 10) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int cell))) (b (Array Int (Array Int cell))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155) 1 10
     (select b (+ (- b__first a__first) temp___idx_155)) 1 10) true))))))))

(declare-const b (Array Int (Array Int cell)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort x_coord 0)

(declare-fun x_coordqtint (x_coord) Int)

;; x_coord'axiom
  (assert
  (forall ((i x_coord))
  (and (<= 1 (x_coordqtint i)) (<= (x_coordqtint i) 10))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (x_coord x_coord) Bool)

(declare-const dummy3 x_coord)

(declare-datatypes ()
((x_coord__ref (x_coord__refqtmk (x_coord__content x_coord)))))
(define-fun x_coord__ref_x_coord__content__projection ((a x_coord__ref)) x_coord 
  (x_coord__content a))

(declare-sort y_coord 0)

(declare-fun y_coordqtint (y_coord) Int)

;; y_coord'axiom
  (assert
  (forall ((i y_coord))
  (and (<= 1 (y_coordqtint i)) (<= (y_coordqtint i) 50))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 50)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (y_coord y_coord) Bool)

(declare-const dummy4 y_coord)

(declare-datatypes ()
((y_coord__ref (y_coord__refqtmk (y_coord__content y_coord)))))
(define-fun y_coord__ref_y_coord__content__projection ((a y_coord__ref)) y_coord 
  (y_coord__content a))

(define-fun dynamic_invariant1 ((temp___expr_546 Int)
  (temp___is_init_542 Bool) (temp___skip_constant_543 Bool)
  (temp___do_toplevel_544 Bool)
  (temp___do_typ_inv_545 Bool)) Bool (=>
                                     (or (= temp___is_init_542 true)
                                     (<= 0 7)) (in_range1 temp___expr_546)))

(define-fun dynamic_invariant2 ((temp___expr_567 Int)
  (temp___is_init_563 Bool) (temp___skip_constant_564 Bool)
  (temp___do_toplevel_565 Bool)
  (temp___do_typ_inv_566 Bool)) Bool (=>
                                     (or (= temp___is_init_563 true)
                                     (<= 1 10)) (in_range2 temp___expr_567)))

(define-fun dynamic_invariant3 ((temp___expr_574 Int)
  (temp___is_init_570 Bool) (temp___skip_constant_571 Bool)
  (temp___do_toplevel_572 Bool)
  (temp___do_typ_inv_573 Bool)) Bool (=>
                                     (or (= temp___is_init_570 true)
                                     (<= 1 50)) (in_range3 temp___expr_574)))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant y true false true true))

;; Assume
  (assert (dynamic_invariant x true false true true))

;; H
  (assert (in_range2 x))

;; H
  (assert (in_range3 y))

(assert
;; defqtvc
 ;; File "tetris_functional.ads", line 144, characters 0-0
  (not (<= 1 y)))
(check-sat)