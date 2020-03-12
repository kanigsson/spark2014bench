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

(declare-sort shape 0)

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (shape shape) Bool)

(declare-const dummy shape)

(declare-datatypes () ((shape__ref (shape__refqtmk (shape__content shape)))))
(define-fun shape__ref_shape__content__projection ((a shape__ref)) shape 
  (shape__content a))

(declare-fun to_rep (shape) Int)

(declare-fun of_rep (Int) shape)

;; inversion_axiom
  (assert
  (forall ((x shape)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x shape)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort px_coord 0)

(declare-fun px_coordqtint (px_coord) Int)

;; px_coord'axiom
  (assert
  (forall ((i px_coord))
  (and (<= (- 1) (px_coordqtint i)) (<= (px_coordqtint i) 9))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 1) x) (<= x 9)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (px_coord px_coord) Bool)

(declare-const dummy1 px_coord)

(declare-datatypes ()
((px_coord__ref (px_coord__refqtmk (px_coord__content px_coord)))))
(define-fun px_coord__ref_px_coord__content__projection ((a px_coord__ref)) px_coord 
  (px_coord__content a))

(define-fun to_rep1 ((x px_coord)) Int (px_coordqtint x))

(declare-fun of_rep1 (Int) px_coord)

;; inversion_axiom
  (assert
  (forall ((x px_coord))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x px_coord)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort py_coord 0)

(declare-fun py_coordqtint (py_coord) Int)

;; py_coord'axiom
  (assert
  (forall ((i py_coord))
  (and (<= (- 1) (py_coordqtint i)) (<= (py_coordqtint i) 49))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 1) x) (<= x 49)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (py_coord py_coord) Bool)

(declare-const dummy2 py_coord)

(declare-datatypes ()
((py_coord__ref (py_coord__refqtmk (py_coord__content py_coord)))))
(define-fun py_coord__ref_py_coord__content__projection ((a py_coord__ref)) py_coord 
  (py_coord__content a))

(define-fun to_rep2 ((x py_coord)) Int (py_coordqtint x))

(declare-fun of_rep2 (Int) py_coord)

;; inversion_axiom
  (assert
  (forall ((x py_coord))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x py_coord)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort direction 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (direction direction) Bool)

(declare-const dummy3 direction)

(declare-datatypes ()
((direction__ref (direction__refqtmk (direction__content direction)))))
(define-fun direction__ref_direction__content__projection ((a direction__ref)) direction 
  (direction__content a))

(declare-fun to_rep3 (direction) Int)

(declare-fun of_rep3 (Int) direction)

;; inversion_axiom
  (assert
  (forall ((x direction))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x direction)) (! (in_range3
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__tetris_initial__piece__s shape)(rec__tetris_initial__piece__d direction)(rec__tetris_initial__piece__x px_coord)(rec__tetris_initial__piece__y py_coord)))))
(define-fun us_split_fields_rec__tetris_initial__piece__s__projection ((a us_split_fields)) shape 
  (rec__tetris_initial__piece__s a))

(define-fun us_split_fields_rec__tetris_initial__piece__d__projection ((a us_split_fields)) direction 
  (rec__tetris_initial__piece__d a))

(define-fun us_split_fields_rec__tetris_initial__piece__x__projection ((a us_split_fields)) px_coord 
  (rec__tetris_initial__piece__x a))

(define-fun us_split_fields_rec__tetris_initial__piece__y__projection ((a us_split_fields)) py_coord 
  (rec__tetris_initial__piece__y a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__tetris_initial__piece__s
                           (us_split_fields1 a))) (to_rep
                                                  (rec__tetris_initial__piece__s
                                                  (us_split_fields1 b))))
                        (= (to_rep3
                           (rec__tetris_initial__piece__d
                           (us_split_fields1 a))) (to_rep3
                                                  (rec__tetris_initial__piece__d
                                                  (us_split_fields1 b)))))
                        (and
                        (= (to_rep1
                           (rec__tetris_initial__piece__x
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__tetris_initial__piece__x
                                                  (us_split_fields1 b))))
                        (= (to_rep2
                           (rec__tetris_initial__piece__y
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__tetris_initial__piece__y
                                                  (us_split_fields1 b))))))
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

(declare-const tetris_initial__piece__s__first__bit Int)

(declare-const tetris_initial__piece__s__last__bit Int)

(declare-const tetris_initial__piece__s__position Int)

;; tetris_initial__piece__s__first__bit_axiom
  (assert (<= 0 tetris_initial__piece__s__first__bit))

;; tetris_initial__piece__s__last__bit_axiom
  (assert
  (< tetris_initial__piece__s__first__bit tetris_initial__piece__s__last__bit))

;; tetris_initial__piece__s__position_axiom
  (assert (<= 0 tetris_initial__piece__s__position))

(declare-const tetris_initial__piece__d__first__bit Int)

(declare-const tetris_initial__piece__d__last__bit Int)

(declare-const tetris_initial__piece__d__position Int)

;; tetris_initial__piece__d__first__bit_axiom
  (assert (<= 0 tetris_initial__piece__d__first__bit))

;; tetris_initial__piece__d__last__bit_axiom
  (assert
  (< tetris_initial__piece__d__first__bit tetris_initial__piece__d__last__bit))

;; tetris_initial__piece__d__position_axiom
  (assert (<= 0 tetris_initial__piece__d__position))

(declare-const tetris_initial__piece__x__first__bit Int)

(declare-const tetris_initial__piece__x__last__bit Int)

(declare-const tetris_initial__piece__x__position Int)

;; tetris_initial__piece__x__first__bit_axiom
  (assert (<= 0 tetris_initial__piece__x__first__bit))

;; tetris_initial__piece__x__last__bit_axiom
  (assert
  (< tetris_initial__piece__x__first__bit tetris_initial__piece__x__last__bit))

;; tetris_initial__piece__x__position_axiom
  (assert (<= 0 tetris_initial__piece__x__position))

(declare-const tetris_initial__piece__y__first__bit Int)

(declare-const tetris_initial__piece__y__last__bit Int)

(declare-const tetris_initial__piece__y__position Int)

;; tetris_initial__piece__y__first__bit_axiom
  (assert (<= 0 tetris_initial__piece__y__first__bit))

;; tetris_initial__piece__y__last__bit_axiom
  (assert
  (< tetris_initial__piece__y__first__bit tetris_initial__piece__y__last__bit))

;; tetris_initial__piece__y__position_axiom
  (assert (<= 0 tetris_initial__piece__y__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ()
((piece__ref (piece__refqtmk (piece__content us_rep)))))
(define-fun piece__ref_piece__content__projection ((a piece__ref)) us_rep 
  (piece__content a))

(declare-fun turn_direction (Int Int) Int)

(declare-fun turn_direction__function_guard (Int Int Int) Bool)

(define-fun dynamic_invariant ((temp___expr_615 Int)
  (temp___is_init_611 Bool) (temp___skip_constant_612 Bool)
  (temp___do_toplevel_613 Bool)
  (temp___do_typ_inv_614 Bool)) Bool (=>
                                     (or (= temp___is_init_611 true)
                                     (<= 0 3)) (in_range3 temp___expr_615)))

(declare-sort turn_action 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 3 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (turn_action turn_action) Bool)

(declare-const dummy5 turn_action)

(declare-datatypes ()
((turn_action__ref (turn_action__refqtmk (turn_action__content turn_action)))))
(define-fun turn_action__ref_turn_action__content__projection ((a turn_action__ref)) turn_action 
  (turn_action__content a))

(define-fun dynamic_invariant1 ((temp___expr_715 Int)
  (temp___is_init_711 Bool) (temp___skip_constant_712 Bool)
  (temp___do_toplevel_713 Bool)
  (temp___do_typ_inv_714 Bool)) Bool (=>
                                     (or (= temp___is_init_711 true)
                                     (<= 3 4)) (in_range4 temp___expr_715)))

;; turn_direction__post_axiom
  (assert
  (forall ((d Int) (t Int))
  (! (=>
     (and (dynamic_invariant d true true true true) (dynamic_invariant1 t
     true true true true))
     (let ((result (turn_direction d t)))
     (=> (turn_direction__function_guard result d t) (dynamic_invariant
     result true false true true)))) :pattern ((turn_direction d t)) )))

;; turn_direction__def_axiom
  (assert
  (forall ((d Int) (t Int))
  (! (=>
     (and (dynamic_invariant d true true true true) (dynamic_invariant1 t
     true true true true))
     (= (turn_direction d t) (ite (= t 3) (ite (= d 0) 3 (- d 1))
                             (ite (= d 3) 0 (+ d 1))))) :pattern ((turn_direction
                                                                  d t)) )))

(declare-const p us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort action 0)

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (action action) Bool)

(declare-const dummy6 action)

(declare-datatypes ()
((action__ref (action__refqtmk (action__content action)))))
(define-fun action__ref_action__content__projection ((a1 action__ref)) action 
  (action__content a1))

(define-fun dynamic_invariant2 ((temp___expr_701 Int)
  (temp___is_init_697 Bool) (temp___skip_constant_698 Bool)
  (temp___do_toplevel_699 Bool)
  (temp___do_typ_inv_700 Bool)) Bool (=>
                                     (or (= temp___is_init_697 true)
                                     (<= 0 4)) (in_range5 temp___expr_701)))

(define-fun dynamic_invariant3 ((temp___expr_550 Int)
  (temp___is_init_546 Bool) (temp___skip_constant_547 Bool)
  (temp___do_toplevel_548 Bool)
  (temp___do_typ_inv_549 Bool)) Bool (=>
                                     (or (= temp___is_init_546 true)
                                     (<= 1 7)) (in_range temp___expr_550)))

(define-fun dynamic_invariant4 ((temp___expr_601 Int)
  (temp___is_init_597 Bool) (temp___skip_constant_598 Bool)
  (temp___do_toplevel_599 Bool)
  (temp___do_typ_inv_600 Bool)) Bool (=>
                                     (or (= temp___is_init_597 true)
                                     (<= (- 1) 9)) (in_range1
                                     temp___expr_601)))

(define-fun dynamic_invariant5 ((temp___expr_608 Int)
  (temp___is_init_604 Bool) (temp___skip_constant_605 Bool)
  (temp___do_toplevel_606 Bool)
  (temp___do_typ_inv_607 Bool)) Bool (=>
                                     (or (= temp___is_init_604 true)
                                     (<= (- 1) 49)) (in_range2
                                     temp___expr_608)))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 a true false true true))

;; H
  (assert (not (= a 0)))

;; H
  (assert (not (= a 1)))

;; H
  (assert (= a 2))

(declare-const o Int)

;; Ensures
  (assert
  (= (to_rep2 (rec__tetris_initial__piece__y (us_split_fields1 p))) o))

(assert
;; defqtvc
 ;; File "tetris_initial.ads", line 168, characters 0-0
  (not (in_range2 (+ o 1))))
(check-sat)
