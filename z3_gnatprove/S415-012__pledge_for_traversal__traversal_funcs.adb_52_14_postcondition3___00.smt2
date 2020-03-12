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

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

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
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort us_main_type 0)

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (rec__traversal_funcs__list_acc__is_null_pointer Bool)(rec__traversal_funcs__list_acc__pointer_address Int)(rec__traversal_funcs__list_acc__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__traversal_funcs__list_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__traversal_funcs__list_acc__is_null_pointer a))

(define-fun us_rep_rec__traversal_funcs__list_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__traversal_funcs__list_acc__pointer_address a))

(define-fun us_rep_rec__traversal_funcs__list_acc__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__traversal_funcs__list_acc__pointer_value_abstr a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__traversal_funcs__list_acc__is_null_pointer
                           a) (rec__traversal_funcs__list_acc__is_null_pointer
                              b))
                        (=>
                        (not
                        (= (rec__traversal_funcs__list_acc__is_null_pointer
                           a) true))
                        (and
                        (= (rec__traversal_funcs__list_acc__pointer_address
                           a) (rec__traversal_funcs__list_acc__pointer_address
                              b))
                        (= (rec__traversal_funcs__list_acc__pointer_value_abstr
                           a) (rec__traversal_funcs__list_acc__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy2 us_rep)

(declare-datatypes () ((t2b__ref (t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

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

(declare-const dummy3 us_rep)

(declare-datatypes ()
((list_acc__ref (list_acc__refqtmk (list_acc__content us_rep)))))
(define-fun list_acc__ref_list_acc__content__projection ((a list_acc__ref)) us_rep 
  (list_acc__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__traversal_funcs__list__v integer)(rec__traversal_funcs__list__n us_rep)))))
(define-fun us_split_fields_rec__traversal_funcs__list__v__projection ((a us_split_fields)) integer 
  (rec__traversal_funcs__list__v a))

(define-fun us_split_fields_rec__traversal_funcs__list__n__projection ((a us_split_fields)) us_rep 
  (rec__traversal_funcs__list__n a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__traversal_funcs__list__v
                            (us_split_fields1 a))) (to_rep
                                                   (rec__traversal_funcs__list__v
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__traversal_funcs__list__n
                            (us_split_fields1 a))
                            (rec__traversal_funcs__list__n
                            (us_split_fields1 b))) true))
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

(declare-const traversal_funcs__list__v__first__bit Int)

(declare-const traversal_funcs__list__v__last__bit Int)

(declare-const traversal_funcs__list__v__position Int)

;; traversal_funcs__list__v__first__bit_axiom
  (assert (<= 0 traversal_funcs__list__v__first__bit))

;; traversal_funcs__list__v__last__bit_axiom
  (assert
  (< traversal_funcs__list__v__first__bit traversal_funcs__list__v__last__bit))

;; traversal_funcs__list__v__position_axiom
  (assert (<= 0 traversal_funcs__list__v__position))

(declare-const traversal_funcs__list__n__first__bit Int)

(declare-const traversal_funcs__list__n__last__bit Int)

(declare-const traversal_funcs__list__n__position Int)

;; traversal_funcs__list__n__first__bit_axiom
  (assert (<= 0 traversal_funcs__list__n__first__bit))

;; traversal_funcs__list__n__last__bit_axiom
  (assert
  (< traversal_funcs__list__n__first__bit traversal_funcs__list__n__last__bit))

;; traversal_funcs__list__n__position_axiom
  (assert (<= 0 traversal_funcs__list__n__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes () ((list__ref (list__refqtmk (list__content us_rep1)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep1 
  (list__content a))

(declare-fun us_open (us_main_type) us_rep1)

(declare-fun us_close (us_rep1) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep1))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__traversal_funcs__list_acc__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__traversal_funcs__list_acc__pointer_value_abstr a)))

(define-fun rec__traversal_funcs__list_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__traversal_funcs__list_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__traversal_funcs__list_acc__is_null_pointer us_null_pointer) true))

;; length__def_axiom
  (assert
  (forall ((l us_rep))
  (! (=> (length__function_guard (length l) l)
     (and
     (forall ((l1 us_rep)) (length__function_guard
     (length
     (rec__traversal_funcs__list__n
     (us_split_fields1 (rec__traversal_funcs__list_acc__pointer_value l1))))
     (rec__traversal_funcs__list__n
     (us_split_fields1 (rec__traversal_funcs__list_acc__pointer_value l1)))))
     (= (length l) (ite (= (bool_eq l us_null_pointer) true) 0
                   (+ (min 2147483646
                      (length
                      (rec__traversal_funcs__list__n
                      (us_split_fields1
                      (rec__traversal_funcs__list_acc__pointer_value l))))) 1))))) :pattern (
  (length l)) )))

(declare-const dummy5 us_rep)

(declare-datatypes () ((t3b__ref (t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep (t3b__content
                                                                    a))

(declare-const dummy6 us_rep)

(declare-datatypes () ((t4b__ref (t4b__refqtmk (t4b__content us_rep)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_rep (t4b__content
                                                                    a))

(declare-fun next (us_rep) us_rep)

(declare-fun next__function_guard (us_rep us_rep) Bool)

(declare-sort us_pledge_ty 0)

(declare-datatypes ()
((us_pledge_ty__ref
 (us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep us_rep) Bool)

(declare-fun traversal_funcs__next__pledge (us_rep) us_pledge_ty)

;; next__post_axiom
  (assert
  (forall ((x us_rep))
  (! (and (forall ((x1 us_rep)) (length__function_guard (length x1) x1))
     (=> (< (length x) 2147483647)
     (let ((result (next x)))
     (and
     (forall ((result1 us_rep)) (length__function_guard (length result1)
     result1))
     (and (forall ((x1 us_rep)) (length__function_guard (length x1) x1))
     (and
     (forall ((temp___brower_210 us_rep)) (length__function_guard
     (length temp___brower_210) temp___brower_210))
     (and
     (forall ((temp___borrowed_211 us_rep)) (length__function_guard
     (length temp___borrowed_211) temp___borrowed_211))
     (and
     (forall ((temp___brower_210 us_rep)) (length__function_guard
     (length temp___brower_210) temp___brower_210))
     (=> (next__function_guard result x)
     (let ((us_result_pledge (traversal_funcs__next__pledge x)))
     (and
     (ite (= (bool_eq x us_null_pointer) true)
     (and (= (bool_eq result us_null_pointer) true)
     (= (ite (forall ((temp___borrowed_216 us_rep))
             (forall ((temp___brower_215 us_rep))
             (! (=>
                (and
                (= (us_pledge_get us_result_pledge temp___borrowed_216
                   temp___brower_215) true)
                (and
                (= (rec__traversal_funcs__list_acc__is_null_pointer x) 
                (rec__traversal_funcs__list_acc__is_null_pointer
                temp___borrowed_216))
                (= (rec__traversal_funcs__list_acc__is_null_pointer result) 
                (rec__traversal_funcs__list_acc__is_null_pointer
                temp___brower_215))))
                (= (bool_eq temp___borrowed_216 us_null_pointer) true)) :pattern (
             (us_pledge_get us_result_pledge temp___borrowed_216
             temp___brower_215)) )))
        true false) true))
     (and (= (length result) (- (length x) 1))
     (= (ite (forall ((temp___borrowed_211 us_rep))
             (forall ((temp___brower_210 us_rep))
             (! (=>
                (and
                (= (us_pledge_get us_result_pledge temp___borrowed_211
                   temp___brower_210) true)
                (and
                (= (rec__traversal_funcs__list_acc__is_null_pointer x) 
                (rec__traversal_funcs__list_acc__is_null_pointer
                temp___borrowed_211))
                (= (rec__traversal_funcs__list_acc__is_null_pointer result) 
                (rec__traversal_funcs__list_acc__is_null_pointer
                temp___brower_210))))
                (=> (< (length temp___brower_210) 2147483647)
                (= (length temp___borrowed_211) (+ (length temp___brower_210) 1)))) :pattern (
             (us_pledge_get us_result_pledge temp___borrowed_211
             temp___brower_210)) )))
        true false) true)))
     (= (us_pledge_get us_result_pledge x result) true)))))))))))) :pattern (
  (next x)) )))

(declare-const x__pointer_address Int)

(declare-const x__is_null_pointer Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const dummy7 us_rep)

(declare-datatypes () ((t16b__ref (t16b__refqtmk (t16b__content us_rep)))))
(define-fun t16b__ref_t16b__content__projection ((a t16b__ref)) us_rep 
  (t16b__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort us_pledge_ty1 0)

(declare-datatypes ()
((us_pledge_ty__ref1
 (us_pledge_ty__refqtmk1 (us_pledge_ty__content1 us_pledge_ty1)))))
(declare-fun us_pledge_get1 (us_pledge_ty1 us_rep us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_184 us_rep)
  (temp___skip_top_level_185 Bool)) Bool (= (rec__traversal_funcs__list_acc__is_null_pointer
                                            temp___expr_184) true))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun default_initial_assumption1 ((temp___expr_191 us_rep1)
  (temp___skip_top_level_192 Bool)) Bool (= (rec__traversal_funcs__list_acc__is_null_pointer
                                            (rec__traversal_funcs__list__n
                                            (us_split_fields1
                                            temp___expr_191))) true))

;; length__post_axiom
  (assert
  (forall ((l us_rep))
  (! (let ((result (length l)))
     (=> (length__function_guard result l) (dynamic_invariant result true
     false true true))) :pattern ((length l)) )))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 3))

(declare-const x__pointer_value us_split_fields)

(declare-const x__pointer_value1 us_split_fields)

;; H
  (assert (= x__pointer_value1 x__pointer_value))

;; Assume
  (assert true)

;; H
  (assert
  (forall ((x__pointer_value2 us_split_fields)) (length__function_guard
  (length
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value2))))
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value2))))))

;; H
  (assert
  (forall ((x__pointer_value2 us_split_fields)) (length__function_guard
  (length
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value2))))
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value2))))))

;; Assume
  (assert
  (and
  (< (length
     (us_repqtmk x__is_null_pointer x__pointer_address
     (us_close (us_repqtmk1 x__pointer_value)))) 2147483647)
  (<= 2 (length
        (us_repqtmk x__is_null_pointer x__pointer_address
        (us_close (us_repqtmk1 x__pointer_value)))))))

(define-fun o () us_rep (us_repqtmk x__is_null_pointer x__pointer_address
                        (us_close (us_repqtmk1 x__pointer_value))))

(define-fun o1 () Int (length o))

;; H
  (assert
  (forall ((o2 us_rep)) (length__function_guard
  (length
  (rec__traversal_funcs__list__n
  (us_split_fields1 (rec__traversal_funcs__list_acc__pointer_value o2))))
  (rec__traversal_funcs__list__n
  (us_split_fields1 (rec__traversal_funcs__list_acc__pointer_value o2))))))

;; H
  (assert (length__function_guard o1 o))

;; H
  (assert (dynamic_invariant o1 true false true true))

;; H
  (assert
  (= o1 (ite (= (bool_eq o us_null_pointer) true) 0
        (+ (min 2147483646
           (length
           (rec__traversal_funcs__list__n
           (us_split_fields1
           (rec__traversal_funcs__list_acc__pointer_value o))))) 1))))

(declare-const l Int)

;; H
  (assert (= l o1))

;; Assume
  (assert (dynamic_invariant l true false true true))

(define-fun o2 () us_rep (us_repqtmk x__is_null_pointer x__pointer_address
                         (us_close (us_repqtmk1 x__pointer_value))))

(define-fun o3 () us_rep (next o2))

;; H
  (assert (forall ((o4 us_rep)) (length__function_guard (length o4) o4)))

;; H
  (assert (forall ((o4 us_rep)) (length__function_guard (length o4) o4)))

;; H
  (assert
  (forall ((temp___brower_200 us_rep)) (length__function_guard
  (length temp___brower_200) temp___brower_200)))

;; H
  (assert
  (forall ((temp___borrowed_201 us_rep)) (length__function_guard
  (length temp___borrowed_201) temp___borrowed_201)))

;; H
  (assert
  (forall ((temp___brower_200 us_rep)) (length__function_guard
  (length temp___brower_200) temp___brower_200)))

;; H
  (assert (next__function_guard o3 o2))

;; H
  (assert
  (let ((us_result_pledge (traversal_funcs__next__pledge o2)))
  (and
  (ite (= (bool_eq o2 us_null_pointer) true)
  (and (= (bool_eq o3 us_null_pointer) true)
  (forall ((temp___borrowed_206 us_rep))
  (forall ((temp___brower_205 us_rep))
  (! (=>
     (and
     (= (us_pledge_get us_result_pledge temp___borrowed_206
        temp___brower_205) true)
     (and
     (= x__is_null_pointer (rec__traversal_funcs__list_acc__is_null_pointer
                           temp___borrowed_206))
     (= (rec__traversal_funcs__list_acc__is_null_pointer o3) (rec__traversal_funcs__list_acc__is_null_pointer
                                                             temp___brower_205))))
     (= (bool_eq temp___borrowed_206 us_null_pointer) true)) :pattern (
  (us_pledge_get us_result_pledge temp___borrowed_206 temp___brower_205)) ))))
  (and (= (length o3) (- (length o2) 1))
  (forall ((temp___borrowed_201 us_rep))
  (forall ((temp___brower_200 us_rep))
  (! (=>
     (and
     (= (us_pledge_get us_result_pledge temp___borrowed_201
        temp___brower_200) true)
     (and
     (= x__is_null_pointer (rec__traversal_funcs__list_acc__is_null_pointer
                           temp___borrowed_201))
     (= (rec__traversal_funcs__list_acc__is_null_pointer o3) (rec__traversal_funcs__list_acc__is_null_pointer
                                                             temp___brower_200))))
     (=> (< (length temp___brower_200) 2147483647)
     (= (length temp___borrowed_201) (+ (length temp___brower_200) 1)))) :pattern (
  (us_pledge_get us_result_pledge temp___borrowed_201 temp___brower_200)) )))))
  (= (us_pledge_get us_result_pledge o2 o3) true))))

(define-fun traversal_funcs__p1__c__assume () us_rep (rec__traversal_funcs__list__n
                                                     (us_split_fields1
                                                     (rec__traversal_funcs__list_acc__pointer_value
                                                     o3))))

(declare-const usf us_pledge_ty1)

;; H
  (assert
  (forall ((x__pointer_value2 us_split_fields)) (next__function_guard
  (next
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value2))))
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value2))))))

;; H
  (assert
  (forall ((x__pointer_value2 us_split_fields)) (next__function_guard
  (next
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value2))))
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value2))))))

;; Ensures
  (assert
  (forall ((temp___borrowed_313 us_rep))
  (forall ((temp___brower_307 us_rep))
  (! (= (us_pledge_get1 usf temp___borrowed_313 temp___brower_307) (ite 
                                                                   (exists
                                                                   ((temp___borrowed_312 us_rep))
                                                                   (and
                                                                   (= 
                                                                   x__is_null_pointer 
                                                                   (rec__traversal_funcs__list_acc__is_null_pointer
                                                                   temp___borrowed_312))
                                                                   (= (and 
                                                                   (ite (= temp___borrowed_313 temp___borrowed_312)
                                                                   true
                                                                   false) (and 
                                                                   (us_pledge_get
                                                                   (traversal_funcs__next__pledge
                                                                   (us_repqtmk
                                                                   x__is_null_pointer
                                                                   x__pointer_address
                                                                   (us_close
                                                                   (us_repqtmk1
                                                                   x__pointer_value))))
                                                                   temp___borrowed_312
                                                                   (let ((temp___311 
                                                                   (next
                                                                   (us_repqtmk
                                                                   x__is_null_pointer
                                                                   x__pointer_address
                                                                   (us_close
                                                                   (us_repqtmk1
                                                                   x__pointer_value))))))
                                                                   (us_repqtmk
                                                                   (rec__traversal_funcs__list_acc__is_null_pointer
                                                                   temp___311)
                                                                   (rec__traversal_funcs__list_acc__pointer_address
                                                                   temp___311)
                                                                   (us_close
                                                                   (us_repqtmk1
                                                                   (us_split_fieldsqtmk
                                                                   (rec__traversal_funcs__list__v
                                                                   (us_split_fields1
                                                                   (rec__traversal_funcs__list_acc__pointer_value
                                                                   (next
                                                                   (us_repqtmk
                                                                   x__is_null_pointer
                                                                   x__pointer_address
                                                                   (us_close
                                                                   (us_repqtmk1
                                                                   x__pointer_value)))))))
                                                                   temp___brower_307)))))) 
                                                                   (ite true
                                                                   true
                                                                   false))) true)))
                                                                   true
                                                                   false)) :pattern (
  (us_pledge_get1 usf temp___borrowed_313 temp___brower_307)) ))))

(declare-const traversal_funcs__p1__c__pledge us_pledge_ty1)

(define-fun traversal_funcs__p1__c__pledge1 () us_pledge_ty__ref1 (us_pledge_ty__refqtmk1
                                                                  traversal_funcs__p1__c__pledge))

;; H
  (assert (= traversal_funcs__p1__c__pledge usf))

(declare-const c__pointer_value us_split_fields)

;; H
  (assert
  (= (us_repqtmk1 c__pointer_value) (rec__traversal_funcs__list_acc__pointer_value
                                    traversal_funcs__p1__c__assume)))

(declare-const c__pointer_address Int)

;; H
  (assert
  (= c__pointer_address (rec__traversal_funcs__list_acc__pointer_address
                        traversal_funcs__p1__c__assume)))

(declare-const c__is_null_pointer Bool)

;; H
  (assert
  (= c__is_null_pointer (rec__traversal_funcs__list_acc__is_null_pointer
                        traversal_funcs__p1__c__assume)))

;; H
  (assert
  (forall ((temp___borrowed_323 us_rep)) (length__function_guard
  (length temp___borrowed_323) temp___borrowed_323)))

;; H
  (assert
  (forall ((temp___brower_325 us_rep)) (length__function_guard
  (length temp___brower_325) temp___brower_325)))

;; H
  (assert
  (forall ((temp___borrowed_326 us_rep)) (length__function_guard
  (length temp___borrowed_326) temp___borrowed_326)))

;; H
  (assert
  (forall ((temp___brower_325 us_rep)) (length__function_guard
  (length temp___brower_325) temp___brower_325)))

;; Assert
  (assert
  (ite (< l 2)
  (forall ((temp___borrowed_323 us_rep))
  (forall ((temp___brower_322 us_rep))
  (! (=>
     (and
     (= (us_pledge_get1 traversal_funcs__p1__c__pledge temp___borrowed_323
        temp___brower_322) true)
     (and
     (= x__is_null_pointer (rec__traversal_funcs__list_acc__is_null_pointer
                           temp___borrowed_323))
     (= c__is_null_pointer (rec__traversal_funcs__list_acc__is_null_pointer
                           temp___brower_322))))
     (= (length temp___borrowed_323) l)) :pattern ((us_pledge_get1
                                                   (us_pledge_ty__content1
                                                   traversal_funcs__p1__c__pledge1)
                                                   temp___borrowed_323
                                                   temp___brower_322)) )))
  (forall ((temp___borrowed_326 us_rep))
  (forall ((temp___brower_325 us_rep))
  (! (=>
     (and
     (= (us_pledge_get1 traversal_funcs__p1__c__pledge temp___borrowed_326
        temp___brower_325) true)
     (and
     (= x__is_null_pointer (rec__traversal_funcs__list_acc__is_null_pointer
                           temp___borrowed_326))
     (= c__is_null_pointer (rec__traversal_funcs__list_acc__is_null_pointer
                           temp___brower_325))))
     (=> (< (length temp___brower_325) 2147483646)
     (= (length temp___borrowed_326) (+ (length temp___brower_325) 2)))) :pattern (
  (us_pledge_get1 (us_pledge_ty__content1 traversal_funcs__p1__c__pledge1)
  temp___borrowed_326 temp___brower_325)) )))))

(declare-const c__pointer_value1 us_split_fields)

(declare-const spark__branch Bool)

;; H
  (assert
  (= spark__branch (not (bool_eq
                        (us_repqtmk c__is_null_pointer c__pointer_address
                        (us_close (us_repqtmk1 c__pointer_value)))
                        us_null_pointer))))

;; H
  (assert
  (ite (= spark__branch true)
  (= (us_repqtmk1 c__pointer_value1) (rec__traversal_funcs__list_acc__pointer_value
                                     (us_repqtmk c__is_null_pointer
                                     c__pointer_address
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk rliteral
                                     (rec__traversal_funcs__list__n
                                     (us_split_fields1
                                     (rec__traversal_funcs__list_acc__pointer_value
                                     (us_repqtmk c__is_null_pointer
                                     c__pointer_address
                                     (us_close
                                     (us_repqtmk1 c__pointer_value))))))))))))
  (= c__pointer_value1 c__pointer_value)))

(declare-const usf1 us_rep)

;; Assume
  (assert
  (and
  (= (us_pledge_get1 traversal_funcs__p1__c__pledge usf1
     (us_repqtmk c__is_null_pointer c__pointer_address
     (us_close (us_repqtmk1 c__pointer_value1)))) true)
  (= x__is_null_pointer (rec__traversal_funcs__list_acc__is_null_pointer
                        usf1))))

(declare-const x__pointer_value2 us_split_fields)

;; H
  (assert
  (= (us_repqtmk1 x__pointer_value2) (rec__traversal_funcs__list_acc__pointer_value
                                     usf1)))

;; H
  (assert
  (forall ((x__pointer_value3 us_split_fields)) (length__function_guard
  (length
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value3))))
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value3))))))

;; H
  (assert
  (forall ((x__pointer_value3 us_split_fields)) (length__function_guard
  (length
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value3))))
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value3))))))

(assert
;; defqtvc
 ;; File "traversal_funcs.adb", line 49, characters 0-0
  (not
  (= (length
     (us_repqtmk x__is_null_pointer x__pointer_address
     (us_close (us_repqtmk1 x__pointer_value2)))) (length
                                                  (us_repqtmk
                                                  x__is_null_pointer
                                                  x__pointer_address
                                                  (us_close
                                                  (us_repqtmk1
                                                  x__pointer_value1)))))))
(check-sat)
